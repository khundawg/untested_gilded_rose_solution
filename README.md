# My Gilded Rose Code Kata

I decided to document my process of working through this modified version of
the Gilded Rose Kata both for my own learning enjoyment as well as hopefully helping
others who, like me, are trying to see more of the forest and less of the trees.

For this exercise, I began with a stripped down version of the repository with no tests in place as provided
by kbaribeau [here](https://github.com/kbaribeau/gilded_rose_kata).

**Stage 1 - Testing**

I utilized the client specs provided below along with investigative testing to
determine the effect that the update_quality method had on each item within the
sample data array.

After completing the test suite for the kata's current functionality, I decided
to leave both "normal" items in place for a bit just to confirm my refactorings
were working as intended.

You can review my testing approach over two commits,
[here](https://github.com/khundawg/my_gilded_rose_kata/commit/fd9cbcdd4f72c3451db64d6283eee49b45043bae)
and
[here](https://github.com/khundawg/untested_gilded_rose_solution/commit/25b92fcc49c3e9bf41435deefc12534d14d2e57a).

**Stage 2 - First Refactoring**

To get the refactoring rolling, I decided to give each of the special cases its
own method. Rather than pick through the existing conditional reusable code, I
implemented the easiest solution I could think of to get the tests back to
green.

Aged Bree was very straight forward and I didn't even break the tests with
Sulfuras since it doesn't really ever change.

The Backstage Passes were a little more involved. I first continued with the
string of conditionals but after getting some odd test failures, I opted for a
case statement just to help my mental processing. I knew I was going to be back
working on the passes again in a future round of refactoring so the case
statement would work fine for the time.

It was also on the Backstage Passes that I realized I had some wiggle room in my
tests that would need addressing, however, I wanted to finish this round of
refactoring before going off in that direction again.

You can check out my work up to this point here.here

# Original Description of the Gilded Rose

Hi and welcome to team Gilded Rose. As you know, we are a small inn
with a prime location in a prominent city run by a friendly innkeeper
named Allison. We also buy and sell only the finest
goods. Unfortunately, our goods are constantly degrading in quality as
they approach their sell by date. We have a system in place that
updates our inventory for us. It was developed by a no-nonsense type
named Leeroy, who has moved on to new adventures. Your task is to add
the new feature to our system so that we can begin selling a new
category of items. First an introduction to our system:

- All items have a SellIn value which denotes the number of days we
  have to sell the item
- All items have a Quality value which denotes how valuable the item
  is
- At the end of each day our system lowers both values for every item

Pretty simple, right? Well this is where it gets interesting:

  - Once the sell by date has passed, Quality degrades twice as fast
  - The Quality of an item is never negative
  - "Aged Brie" actually increases in Quality the older it gets
  - The Quality of an item is never more than 50
  - "Sulfuras", being a legendary item, never has to be sold or
    decreases in Quality
  - "Backstage passes", like aged brie, increases in Quality as it's
    SellIn value approaches; Quality increases by 2 when there are 10
    days or less and by 3 when there are 5 days or less but Quality
    drops to 0 after the concert

We have recently signed a supplier of conjured items. This requires an update to our system:

- "Conjured" items degrade in Quality twice as fast as normal items

Feel free to make any changes to the UpdateQuality method and add any
new code as long as everything still works correctly. However, do not
alter the Item class or Items property as those belong to the goblin
in the corner who will insta-rage and one-shot you as he doesn't
believe in shared code ownership (you can make the UpdateQuality
method and Items property static if you like, we'll cover for
you). Your work needs to be completed by Friday, February 18, 2011
08:00:00 AM PST.

Just for clarification, an item can never have its Quality increase
above 50, however "Sulfuras" is a legendary item and as such its
Quality is 80 and it never alters.
