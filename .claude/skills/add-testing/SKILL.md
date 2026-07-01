---
name: add-testing
description: This skill contains the rules to be followed when implementing automatic testing
---

# When should this skill be applied?

This skill should be applied when asked for creating new testing for new methods. Also, any time a new method is created, automatic
testing for this method should be created too.

# Where does new testing code go?

Automatic testing code should be implemented in a file whose name should be the name of the class to be tested followed by 'Test' suffix.
For instance, the testing for HolaMundoController.java should be implemented in HolaMundoControllerTest.java.

# Common general comments

The text defined in [comment.txt] (assets/comment.txt) should be added to the beginning of the testing classes.

# Execute automatic testing

Once the automatic testing is implemented, the automatic tests should be run in order to verify all of them pass.