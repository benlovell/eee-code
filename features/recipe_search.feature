Feature: Search for recipes

  So that I can find one recipe among many
  As a web user
  I want to be able search recipes

    Scenario: Matching a word in the ingredient list in full recipe search

      Given a "pancake" recipe with "chocolate chips" in it
      And a "french toast" recipe with "eggs" in it
      When I search for "chocolate"
      Then I should see the "pancake" recipe in the search results
      And I should not see the "french toast" recipe in the search results

    Scenario: Matching a word in the recipe summary

      Given a "pancake" recipe with a "Yummy!" summary
      And  a "french toast" recipe with a "Delicious" summary
      When I search for "yummy"
      Then I should see the "pancake" recipe in the search results
      And I should not see the "french toast" recipe in the search results

    Scenario: Matching a word stem in the recipe instructions

      Given a "pancake" recipe with instructions "mixing together dry ingredients"
      And a "french toast" recipe with instructions "whisking the eggs"
      When I search for "whisk"
      Then I should not see the "pancake" recipe in the search results
      And I should see the "french toast" recipe in the search results

    Scenario: Searching titles

      Given a "pancake" recipe
      And a "french toast" recipe with a summary of "not a pancake"
      When I search titles for "pancake"
      Then I should see the "pancake" recipe in the search results
      And I should not see the "french toast" recipe in the search results

    Scenario: Searching ingredients

      Given a "pancake" recipe with "chocolate chips" in it
      And a "french toast" recipe with eggs in it and a summary of "does not go well with chocolate"
      When I search ingredients for "chocolate"
      Then I should see the "pancake" recipe in the search results
      And I should not see the "french toast" recipe in the search results
