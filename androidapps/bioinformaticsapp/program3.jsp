<%@​ ​page​ ​import="java.io.*"​ ​%> 
<%@​ ​page​ ​import="java.util.*"​ ​%> 
<%! 
public​ ​String​ ​sequence​ ​=​ ​""; 
public​ ​void​ ​listKmers(int​ ​k,​ ​Hashtable<String,​ ​Integer>​ ​frequencies,​ ​Hashtable<String,​ ​Integer> frequencies2) ​ ​​ ​​ ​​ 
​{ ​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ 
	​String​ ​kmer​ ​=​ ​""; ​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​
	String​ ​rkmer​ ​=​ ​""; ​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ 
	​String​ ​rseq​ ​=​ ​computeReverseComplements(); ​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​	
	for(int​ ​i​ ​=​ ​0;​ ​i​ ​<​ ​sequence.length()-k+1;​ ​i++) ​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​
	{ ​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ 
		​kmer​ ​=​ ​sequence.substring(i,​ ​i+k); ​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​
		rkmer​ ​=​ ​rseq.substring(rseq.length()-k-i,​ ​rseq.length()-i); ​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​
		if(kmer.compareTo(rkmer)​ ​<​ ​0) ​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​
		{ ​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​
			if(frequencies.containsKey(kmer)) ​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ 
				​frequencies.replace(kmer,​ ​frequencies.get(kmer),​ ​frequencies.get(kmer)+1); ​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ 
			​else{ ​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​
				frequencies.put(kmer,​ ​1); frequencies2.put(kmer,​ ​0); 
			} ​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ 
		​} ​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​
		else ​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​
		{ ​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​
			if(frequencies.containsKey(rkmer)) ​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ 
				​frequencies.replace(rkmer,​ ​frequencies.get(rkmer),​ ​frequencies.get(rkmer)+1); ​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ 
			​else{ ​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ 
				​frequencies.put(rkmer,​ ​1); frequencies2.put(rkmer,​ ​0); 
			} ​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​
		} ​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​
		kmer​ ​=​ ​""; ​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ 
		​rkmer​ ​=​ ​""; ​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​
	} ​ ​​ ​​ ​​ 
​}   ​ ​​ ​​ ​​ ​
public​ ​String​ ​computeReverseComplements() ​ ​​ ​​ ​​ ​
{ ​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​
	String​ ​rkmer; ​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ 
	​rkmer​ ​=​ ​sequence.replaceAll("A",​ ​"X"); ​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​
	rkmer​ ​=​ ​rkmer.replaceAll("T",​ ​"A"); 
​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​rkmer​ ​=​ ​rkmer.replaceAll("X",​ ​"T"); ​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​
	rkmer​ ​=​ ​rkmer.replaceAll("C",​ ​"X"); ​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ 
	​rkmer​ ​=​ ​rkmer.replaceAll("G",​ ​"C"); ​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ 
	​rkmer​ ​=​ ​rkmer.replaceAll("X",​ ​"G"); ​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​
	rkmer​ ​=​ ​new​ ​StringBuffer(rkmer).reverse().toString(); ​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​
	return​ ​rkmer; ​ ​​ ​​ ​​ ​
} 
public​ ​void​ ​listKmers2(int​ ​k,​ ​Hashtable<String,​ ​Integer>​ ​frequencies2) ​ ​​ ​​ ​​ 
​{ ​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​
	String​ ​kmer​ ​=​ ​""; 
	String​ ​rkmer​ ​=​ ​""; 
	String​ ​rseq​ ​=​ ​computeReverseComplements(); ​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​
	for(int​ ​i​ ​=​ ​0;​ ​i​ ​<​ ​sequence.length()-k+1;​ ​i++) ​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​
	{ ​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ 
		​kmer​ ​=​ ​sequence.substring(i,​ ​i+k); 
		rkmer​ ​=​ ​rseq.substring(rseq.length()-k-i,​ ​rseq.length()-i);  
		if(frequencies2.containsKey(kmer))  
			frequencies2.replace(kmer,​ ​frequencies2.get(kmer),​ ​frequencies2.get(kmer)+1); ​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​
		else​ ​if(frequencies2.containsKey(rkmer)) 
			frequencies2.replace(rkmer,​ ​frequencies2.get(rkmer),​ ​frequencies2.get(rkmer)+1); kmer​ ​=​ ​""; rkmer​ ​=​ ​""; ​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ 
	​} ​ ​​ ​​ ​​ 
​} 
%> 
<% 
int​ ​k​ ​=​ ​Integer.parseInt(request.getParameter("k")); 
Hashtable<String,​ ​Integer>​ ​frequencies​ ​=​ ​new​ ​Hashtable<String,​ ​Integer>(); 
Hashtable<String,​ ​Integer>​ ​frequencies2​ ​=​ ​new​ ​Hashtable<String,​ ​Integer>(); 
File​ ​f​ ​=​ ​new​ ​File("C:/data/"​ ​+​ ​request.getParameter("filter")); 
FileReader​ ​fread; ​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​
BufferedReader​ ​bread; ​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ 
​sequence​ ​=​ ​"";   ​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​
String​ ​line​ ​=​ ​""; 
try ​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​
{ ​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​
	fread​ ​=​ ​new​ ​FileReader(f); 
	​bread​ ​=​ ​new​ ​BufferedReader(fread); ​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ 
​	line​ ​=​ ​bread.readLine(); ​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ 
	​while(!((line​ ​=​ ​bread.readLine())​ ​==​ ​null)) ​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​
	{ ​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​
		if(line.contains(">")) ​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​
			sequence​ ​=​ ​""; ​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ 
		​else ​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ 
		​{ ​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​
			sequence​ ​+=​ ​line; ​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​
			listKmers(k,​ ​frequencies,​ ​frequencies2); ​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​
			sequence​ ​=​ ​sequence.substring(sequence.length()-k+1,​ ​sequence.length()); ​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ 
		​} ​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ 
​	}   ​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ 
​	fread.close(); ​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ 
	​bread.close(); ​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​
}catch(Exception​ ​e) ​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ 
​{ ​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ 
	​System.out.println("Failure"); ​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​
} 
	File​ ​f2​ ​=​ ​new​ ​File("C:/data/"​ ​+​ ​request.getParameter("file")); ​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​
	​try ​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​
	{ 
		sequence​ ​=​ ​""; ​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​
		fread​ ​=​ ​new​ ​FileReader(f2); ​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ 
		​bread​ ​=​ ​new​ ​BufferedReader(fread); ​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​
		line​ ​=​ ​bread.readLine(); ​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​
		while(!((line​ ​=​ ​bread.readLine())​ ​==​ ​null)) ​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​
		{ ​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​
			if(line.contains(">")) ​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​
				sequence​ ​=​ ​""; ​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ 
			​else ​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ 
			​{ ​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​
				sequence​ ​+=​ ​line; ​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​
				listKmers2(k,​ ​frequencies2); ​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ 
				​sequence​ ​=​ ​sequence.substring(sequence.length()-k+1,​ ​sequence.length()); ​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​
			} ​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​
		} 

		fread.close(); ​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​
		bread.close(); ​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​
	}catch(Exception​ ​e) ​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​
	{ ​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ 
		​System.out.println(e); ​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​
	} 
	List<String>​ ​keys2​ ​=​ ​new​ ​ArrayList<String>(frequencies.keySet()); ​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​
	Collections.sort(keys2); ​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ 
	​//for(String​ ​key:​ ​keys2) ​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​
		//out.println(key​ ​+​ ​"​ ​"​ ​+​ ​frequencies.get(key)); //out.println("~~~~"); 
 ​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​for(String​ ​key:​ ​keys2) ​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ 
	​out.println(key​ ​+​ ​"~"​ ​+​ ​frequencies2.get(key)); 
%>