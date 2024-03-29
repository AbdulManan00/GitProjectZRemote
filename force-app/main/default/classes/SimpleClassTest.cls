@isTest
public class SimpleClassTest {
  @isTest
  static void testGreet() {
    // Arrange
    String expectedGreeting = 'Hello, Test!';

    // Act
    Test.startTest();

    SimpleClass.greet(expectedGreeting);
    Test.stopTest();

    // Assert
    System.assertEquals(expectedGreeting, 'Hello, Test!');
  }

  @isTest
  static void testAddNumbers() {
    Integer num1 = 5;
    Integer num2 = 7;
    Integer expectedResult = 12;
    Integer result = SimpleClass.addNumbers(num1, num2);
    System.assertEquals(expectedResult, result);
  }

  @isTest
  static void testIsEven() {
    // Arrange
    Integer evenNumber = 10;
    Integer oddNumber = 7;

    // Act & Assert
    System.assertEquals(true, SimpleClass.isEven(evenNumber));
    System.assertEquals(false, SimpleClass.isEven(oddNumber));
  }
}
