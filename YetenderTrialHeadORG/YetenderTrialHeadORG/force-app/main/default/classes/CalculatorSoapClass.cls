global class CalculatorSoapClass {
	
    webservice static double addition(double var1, double var2){
        
        try{
        	return var1+var2;    
        }catch(Exception e){
            return null;
        }
        
    }
    webservice static double subtraction(double var1, double var2){
        
        try{
        	return var1-var2;    
        }catch(Exception e){
            return null;
        }
    }
    webservice static double multiplication(double var1, double var2){
        
        try{
        	return var1*var2;    
        }catch(Exception e){
            return null;
        }
    }
    webservice static double division(double var1, double var2){
        
        try{
            return var1/var2;
        }catch(Exception e){
            return null;
        }
        
    }
}