# A first Cylc Workflow

> [!IMPORTANT]
> Full Cylc documentation, including a full tutorial can be found at
> https://cylc.github.io/cylc-doc.
> Rose documtation is available at https://metomi.github.io/rose.

## Practical

### Aims

After this practical, you should be able to:

* Search for a workflow on GitHub
* Checkout a Cylc workflow from GitHub
* Run the workflow
* Debug a broken task in that workflow
* Modify a task within that workflow
* Rerun the failed task

## Use GitHub to get a copy of the workflow

> [!NOTE]
> This uses links to other resources rather than telling you what to
> do in detail.

1. Find the workflow on GitHub. You've already managed this if
   you are reading this document.
2. Fork this repository. - [How do I fork a repository](https://docs.github.com/en/pull-requests/collaborating-with-pull-requests/working-with-forks/fork-a-repo#forking-a-repository)
3. Clone your fork of the repository to your local computer.
   [How do I clone a repository](https://docs.github.com/en/repositories/creating-and-managing-repositories/cloning-a-repository#cloning-a-repository) - probably:

   ```console

      git clone git@github.com/your_username/mut.git.cylc.intro ~/cylc-src/mut.git.cylc.intro

   ```

## Explore the workflow directory

4. Change directory to the location you cloned your workflow into (`cd ~/cylc-src/mut.git.cylc.intro`?)
5. Run `tree .` (if it is available, else `find . -path "./.git" -prune -o -print`)
6. Note the key files `rose-suite.conf` and `flow.cylc`.
7. Look at the graph section in `flow.cylc` - can you work out which script each task runs?
8. Try looking at the graph using `cylc graph .`.
9. Ensure that you've understood the graph by answering these questions:
   * How many times each year is the model run?
   * Which task runs only at the initial cycle point?
   * Which task runs only at the final cycle point?

## Run the workflow

10. Run a check on the rose configuration: `rose edit` (if you have an X-windows GUI
   environment or `rose macro -V` otherwise. This checks configurations for
   the workflow and for the applications in `./apps`.
11. One of the values is wrong, put it right (It doesn't matter which right option you choose).
12. Run ``cylc validate .`` to check the workflow is valid.
13. Something appears to be wrong - can you work out what it is from the error message and fix it?
   (There's a hint in the comments in `flow.cylc`)
14. Now the workflow and the configuration validate, run the workflow:
   `cylc validate-install-play`.
15. Look at the workflow in `cylc gui` or `cylc tui` (works without GUI access).
16. One of the tasks will fail. See if you can navigate to the task logs in the GUI or TUI.
   and find out why?
17. If you get really stuck run `grep -rin "you should delete this line" *` for a hint.

## Re-install the corrected workflow

18. Use `cylc validate-reinstall mut.git.cylc.intro` to reinstall the workflow to `~cylc-run`.
19. Use `cylc trigger mut.git.cylc.intro//20000101T0000Z/analysis` to re-run the failed
   task.

> [!NOTE]
> * `cylc validate-install-play` can be shortened to `cylc vip`.
> * `cylc validate-reinstall` can be shortened to `cylc vr`.
> * You can trigger multiple tasks at once and Cylc will respect the dependencies
>   between the tasks.

## Examine your changes:

20. Use `git diff` to examine your changes.
21. If you are happy, run `git add <changed file> for each of your changes.
22. Commit your changes with `git commit --message "Fix broken workflow"`

> [!NOTE]
> * `git commit .` will commit changes to every tracked file.
> * `git commit --message` can be shortened to `git commit -m`.

> [!IMPORTANT]
> Git is a distributed version control system.
> You commit will not be on GitHub yet.

23. Use `git push` to push your changes to GitHub. It will probably fail.
   Read the instructions in the failure message.

## Create a Pull Request (PR):

24. [Create a Pull Request](https://docs.github.com/en/pull-requests/collaborating-with-pull-requests/proposing-changes-to-your-work-with-pull-requests/creating-a-pull-request)
   from your fork on GitHub to `metoffice/mut.git.cylc.intro`.
25. Link this PR to issue number https://github.com/MetOffice/mut.git.cylc.intro/issues/1
   by using the "closes" keyword in the PR description.
