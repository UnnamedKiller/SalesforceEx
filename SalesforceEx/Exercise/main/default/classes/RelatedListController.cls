public class RelatedListController {
    @AuraEnabled(cacheable=true)
    //Method to get Records
    public static Map<String, String>  getRecords(){
        Map<String ,  String> helpMap1 = new Map<String, String>();
        Map<String ,  String> helpMap2 = new Map<String, String>();
        Map<String ,  String> resultMap = new Map<String, String>();
        List<String> newB = new List<String>();
        //Cicles to populate both lists with only the name
        for(ObjectB__c obj: [SELECT Name FROM ObjectB__c ORDER BY ObjectB__c.Name LIMIT 500]){
            newB.add(obj.Name);
        }
        System.debug(newB);
        List<String> newC = new List<String>();
        for(ObjectC__c obj: [SELECT Name FROM ObjectC__c ORDER BY ObjectC__c.Name LIMIT 500]){
            newC.add(obj.Name);
        }
        System.debug(newC);
        //Cicle to populate map with values from both lists
        for (Integer i = 0; i < newB.size(); i++) {
            resultMap.put(newB[i], newC[i]);
        }
        System.debug(resultMap);
        return resultMap;
    }
}
/*@AuraEnabled
public static Map<String, Map<String, String>>  getRecords(){
Map<String, Map<String,String>> resultMap = new Map<String, Map<String, String>>();
Map<String, String> helpMap = new Map<String, String>();
List<ObjectC__c> newC = new List<ObjectC__c>();
System.debug(newC);
newC = [SELECT Name, ObjectB__r.name,ObjectB__r.OBjectA__r.name FROM ObjectC__c ALL ROWS];
for (ObjectC__c ojc: newC){
if(ojc.ObjectB__r.OBjectA__r.name != null){
if(ojc.ObjectB__r.Name !=null){
if(!helpMap.containsKey(ojc.ObjectB__r.Name)) {
helpMap.put(ojc.ObjectB__r.Name, ojc.Name);
if(!resultMap.containsKey(ojc.ObjectB__r.OBjectA__r.name)){
resultMap.put(ojc.ObjectB__r.OBjectA__r.Name, new Map<String, String>());
resultMap.get(ojc.ObjectB__r.OBjectA__r.Name).putAll(helpMap);
}
}
}
}  
}
System.debug(helpMap);
System.debug(resultMap);
return resultMap;
}
@AuraEnabled
public static List<String> getObjectB(){
List<String> newB = new List<String>();
for(ObjectB__c obj: [SELECT Name FROM ObjectB__c ORDER BY ObjectB__c.Name]){
newB.add(obj.Name);
}
return newB;
}
@AuraEnabled
public static List<String> getObjectC(){
List<String> newC = new List<String>();
for(ObjectC__c obj: [SELECT Name FROM ObjectC__c ORDER BY ObjectC__c.Name]){
newC.add(obj.Name);
}
return newC;
}
public static Map<String, String>  getRecords2(){

Map<String ,  String> helpMap1 = new Map<String, String>();
Map<String ,  String> helpMap2 = new Map<String, String>();
Map<String ,  String> resultMap = new Map<String, String>();
List<String> newB = new List<String>();
Integer sizeDif;
//Cicles to fill both lists with only the name
for(ObjectB__c obj: [SELECT Name FROM ObjectB__c ORDER BY ObjectB__c.Name]){
newB.add(obj.Name);
helpMap1.put(obj.Name, 'true');
}
List<String> newC = new List<String>();
for(ObjectC__c obj: [SELECT Name FROM ObjectC__c ORDER BY ObjectC__c.Name]){
newC.add(obj.Name);
helpMap2.put('false', obj.Name);
}
if((newC.size()-newB.size())>0){
for (Integer i = 0; i < newB.size(); i++) {
resultMap.put(newB[i], newC[i]);
}
sizeDif = newC.size() - newB.size();
for(Integer i = 0; i < sizeDif; i++){
resultMap.put('null', newC[i]);
}
} else if((newC.size()-newB.size())<0){
sizeDif = newB.size() - newC.size();
for(Integer i = 0; i < sizeDif; i++){
resultMap.put(newB[i], 'null');
newB.remove(i);
}
for (Integer i = 0; i < newC.size(); i++) {
resultMap.put(newB[i], newC[i]);
}
} else {
for (Integer i = 0; i < newC.size(); i++) {
resultMap.put(newB[i], newC[i]);
}
}
System.debug(resultMap);
return resultMap;
}
}*/