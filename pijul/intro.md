# Pijul: Haunting Git at night ?

In this tutorial you will learn how to use the version control system **Pijul**.

It will follow ypu through the basics of change tracking, branching off new ideas and collaborating.
All examples will also relate to the respective GIT operations if applicable. Knowledge in git is therefore strongly required as a prerequisite.

The rest of this introduction will introduce and motivate Pijul. In the following steps you can go hands on with pijul using it as the version control system for a fictive project. Finally you will be shown a glimpse of how Pijul supports collaborating.

So lets start, shall we?

## What is Pijul

### Important things first

Pijul is pronounced: **/ˈpiːχul/**

![](https://i.imgur.com/NtGaNA8.png)
Pronunciation is important...

### Okay, but what is Pijul?

- An independently developed **V**ersion **C**ontrol **S**ystem
- Built upon a **patch based** approach to change tracking (as opposed to *snapshot based* VCS such as git)
- written in Rust
- Homepage: [pijul.org](https://pijul.org)

### Patch based VCS?

You might ask, ask: What does make a VCS "patch based" and why is git snapshot based while pathces are ubiquitous there as well...?

Good question, lets get this straight by looking onto how GIT works

Whenever you `git add` a file, git will actually store a snapshot of this file in its index. This means a *copy* of a file is created each time which is the reason why adding a huge, *changing* file to git is a bad idea, as it inflates the git index size.

Sadly, the git interface is a bit confusing. Git itself and visual clients to it present commits as set of changes. The linux kernel development process is even famous for its patch based contribution process.

```diff
diff --git a/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c b/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
index 6be3ee1d93a5..d68a2bcc9ae1 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
@@ -872,9 +872,9 @@ static int gc0310_s_power(struct v4l2_subdev *sd, int on)
 {
 	int ret;

-	if (on == 0)
+	if (on == 0) {
 		return power_down(sd);
-	else {
+	} else {
 		ret = power_up(sd);
 		if (!ret)
 			return gc0310_init(sd);
```
*a random patch taken from [linux-staging](https://lore.kernel.org/linux-staging/)

In reality, git is computing these diffs on demand when comparing two commits!

This comes with many implications when it comes to *merging*, *rebasing*/*cherry-picking* and ultimately collaborating we will discover as we go on.

Pijul instead does manage files only using patches. That is it does not store full snapshots of files (full of redundant data) but only its changes.
The full state of a version controlled directory is therefore determined by a set of patches and the order they are applied in.
A main inspiration to this was [DARCS](http://darcs.net/) which trackes changes similarly but comes with its own set of problems pijul tries to address...
