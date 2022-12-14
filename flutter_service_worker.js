'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "manifest.json": "bd02a6d15ff2bacad4a9b8b04f379101",
"version.json": "6a79530c71326abb6e08c612078a2471",
"icons/Icon-512.png": "96eee214578dd7224ae7bc31bd9522f3",
"icons/Icon-192.png": "8154e63d50bb3ba9cf9434cf433b98a7",
"icons/Icon-maskable-512.png": "96eee214578dd7224ae7bc31bd9522f3",
"icons/Icon-maskable-192.png": "8154e63d50bb3ba9cf9434cf433b98a7",
"canvaskit/profiling/canvaskit.js": "38164e5a72bdad0faa4ce740c9b8e564",
"canvaskit/profiling/canvaskit.wasm": "95a45378b69e77af5ed2bc72b2209b94",
"canvaskit/canvaskit.js": "2bc454a691c631b07a9307ac4ca47797",
"canvaskit/canvaskit.wasm": "bf50631470eb967688cca13ee181af62",
"favicon.png": "245902ad1e5ce2ecab85784b16bf3a6b",
"flutter.js": "f85e6fb278b0fd20c349186fb46ae36d",
"index.html": "478b88760025dc820f9ba3d6ff4cc35a",
"/": "478b88760025dc820f9ba3d6ff4cc35a",
"main.dart.js": "f86401f0caac42187f92593cd57868be",
"splash/img/dark-4x.png": "4caff1f9bfd32d50ec50654bb1fe906f",
"splash/img/dark-1x.png": "9c2b2817b055e2bf4cddd9ccad3c643f",
"splash/img/dark-2x.png": "d770b122ddfbcefcf168626f8ccc36ed",
"splash/img/light-1x.png": "9c2b2817b055e2bf4cddd9ccad3c643f",
"splash/img/light-3x.png": "c6aaee8ea3a35aa89ae62b10e3adb096",
"splash/img/dark-3x.png": "c6aaee8ea3a35aa89ae62b10e3adb096",
"splash/img/light-2x.png": "d770b122ddfbcefcf168626f8ccc36ed",
"splash/img/light-4x.png": "4caff1f9bfd32d50ec50654bb1fe906f",
"splash/style.css": "3e8699dd65a865ff991ec5b47a93643d",
"splash/splash.js": "123c400b58bea74c1305ca3ac966748d",
"assets/NOTICES": "71c2e414a5af2261a371b8245af38f12",
"assets/Contributors.md": "9c91aaf37a62e19ee807fd16cf6b5d93",
"assets/CHANGELOG.md": "7cd75682e16563f735cee385db725d72",
"assets/shaders/ink_sparkle.frag": "7ff7388e83c41d3004d4335a0e6dca0c",
"assets/FontManifest.json": "7b2a36307916a9721811788013e65289",
"assets/AssetManifest.json": "3bb649c8b2d66a78db6f2cb2b1630f07",
"assets/fonts/MaterialIcons-Regular.otf": "95db9098c58fd6db106f1116bae85a0b",
"assets/assets/images/github-mark.png": "eb94bb97c3410733ce017b184d314723",
"assets/assets/images/github.png": "064ace4777ac86d7627f455f36975452",
"assets/assets/images/gits-dark.png": "2681bccb87c98de44c4f465fcb20f9d6",
"assets/assets/images/placeholder.png": "545a89115bbbb9281c6908b08abd1e80",
"assets/assets/images/gits-light.png": "b034769fe919659bb6537a19c44d232b",
"assets/assets/svg/password_illustration.svg": "c75c278dafcaf9fffc191d6975a67554",
"assets/assets/svg/success_illustration.svg": "e11af632045735bc0c1d867556fa7f22",
"assets/assets/svg/empty_illustration.svg": "d14b9ebb8e424730ce6e50b43b8ae583",
"assets/assets/markdown/how_to_contribute.md": "bac17879cd1e49fa3588b815bb88074b"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
  "main.dart.js",
"index.html",
"assets/AssetManifest.json",
"assets/FontManifest.json"];
// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});

// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});

// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});

self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});

// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}

// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
