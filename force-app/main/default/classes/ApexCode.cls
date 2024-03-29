public class ApexCode {
   @Testvisible private static Decimal Percentage(integer num1,integer num2){
        decimal per=(num1*100)/num2;
        return per;
    }
    public static List<Account> accountList(){
        return [SELECT Id,Name,phone FROM Account];
    }
    
      public static List<Contact> conList(){
        return [SELECT Id,Name,LastName FROM Contact];
    }
    public static Decimal Calculator(string operation,integer num1,integer num2){
        Switch on(operation){
            When 'Add'{
                return num1+num2;
            }
            When 'Subtract'{
                return num1-num2;
            }
            When 'Multiply'{
                return num1*num2;
            }
            When 'Divide'{
                return num1/num2;
            }
            When else{
                return null;
            }
        }
    } 
}