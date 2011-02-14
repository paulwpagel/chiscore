Feature: Adding a checkpoint

In order to populate the system with checkpoints for raceday
As a user
I want to add a checkpoint

  Background:
    Given there are no checkpoints
  
  Scenario: Adding a checkpoint
    Given I am on the new checkpoint page
    When I fill in "Point person" with "Marion Morrison"
    And I fill in "Location" with "Flat Iron"
    And I press "Add Checkpoint"
    Then I have the following checkpoint:
    | Location  | Flat Iron    | 
    | Point Person | Marion Morrison |