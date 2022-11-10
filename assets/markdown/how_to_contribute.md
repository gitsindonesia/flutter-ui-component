# Gits Flutter UI Component

This project aims to simplify and guide the way beginners make their first contribution. If you are looking to make your first contribution, follow the steps below.

#### If you don't have git on your machine, [install it](https://help.github.com/articles/set-up-git/)

## Fork this repository

![fork this repository](https://firstcontributions.github.io/assets/Readme/fork.png)

Fork [this repository](https://github.com/gitsindonesia/flutter-ui-component) by clicking on the fork button on the top of this page.
This will create a copy of this repository in your account.

## Clone the repository

![clone this repository](https://firstcontributions.github.io/assets/Readme/clone.png)

Now clone the forked repository to your machine. Go to your GitHub account, open the forked repository, click on the code button and then click the _copy to clipboard_ icon.

Open a terminal and run the following git command:

```sh
git clone "url you just copied"
```

where "url you just copied" (without the quotation marks) is the url to this repository (your fork of this project). See the previous steps to obtain the url.

![copy URL to clipboard](https://firstcontributions.github.io/assets/Readme/copy-to-clipboard.png)

For example:

```sh
git clone https://github.com/gitsindonesia/flutter-ui-component.git
```

where `this-is-you` is your GitHub username. Here you're copying the contents of the first-contributions repository on GitHub to your computer.

## Create a branch

Change to the repository directory on your computer (if you are not already there):

```sh
cd flutter-ui-component
```

Now create a branch using the `git switch` command:

```sh
git switch -c your-new-branch-name
```

For example:

```sh
git switch -c feat/new_component
```

## Make necessary changes and commit those changes

Now open `Contributors.md` file in a text editor, add your name to it. Don't add it at the beginning or end of the file. Put it anywhere in between. Now, save the file.

![git status](https://firstcontributions.github.io/assets/Readme/git-status.png)

If you go to the project directory and execute the command `git status`, you'll see there are changes.

Add those changes to the branch you just created using the `git add` command:

```sh
git add Contributors.md
```

Now commit those changes using the `git commit` command:

```sh
git commit -m "Add your-name to Contributors list"
```

replacing `your-name` with your name.

## Push changes to GitHub

Push your changes using the command `git push`:

```sh
git push origin -u your-branch-name
```

replacing `your-branch-name` with the name of the branch you created earlier.

## Submit your changes for review

If you go to your repository on GitHub, you'll see a `Compare & pull request` button. Click on that button.

![create a pull request](https://firstcontributions.github.io/assets/Readme/compare-and-pull.png)

Now submit the pull request.

![submit pull request](https://firstcontributions.github.io/assets/Readme/submit-pull-request.png)

Soon I'll be merging all your changes into the main branch of this project. You will get a notification email once the changes have been merged.

## Congrats

Congrats! You just completed the standard _fork -> clone -> edit -> pull request_ workflow that you'll often encounter as a contributor!
