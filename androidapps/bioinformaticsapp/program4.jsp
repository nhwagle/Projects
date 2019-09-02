<%@​ ​page​ ​import="java.io.*"​ ​%> 
<%@​ ​page​ ​import="java.util.*"​ ​%> 
<%! 
//public​ ​int​ ​k​ ​=​ ​0; ​ ​​ ​​ ​​ ​
public​ ​String​ ​sequence; ​ ​​ ​​ ​​ 
​//public​ ​Hashtable<String,​ ​Integer>​ ​frequencies​ ​=​ ​new​ ​Hashtable<String,​ ​Integer>();     
​public​ ​void​ ​listKmers(int​ ​k,​ ​Hashtable<String,​ ​Integer>​ ​frequencies) ​ ​​ ​​ ​​ ​
{ ​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ 
​	String​ ​kmer​ ​=​ ​""; ​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​
	String​ ​rkmer​ ​=​ ​""; ​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​
	String​ ​rseq​ ​=​ ​computeReverseComplements(); ​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​
	for(int​ ​i​ ​=​ ​0;​ ​i​ ​<​ ​sequence.length()-k+1;​ ​i++) ​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​
	{ ​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​
		kmer​ ​=​ ​sequence.substring(i,​ ​i+k); ​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​
		rkmer​ ​=​ ​rseq.substring(rseq.length()-k-i,​ ​rseq.length()-i); ​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ 
		​if(kmer.compareTo(rkmer)​ ​<​ ​0) ​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​
		{ ​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ 
			​if(frequencies.containsKey(kmer)) ​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​
				frequencies.replace(kmer,​ ​frequencies.get(kmer),​ ​frequencies.get(kmer)+1); ​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​
			else ​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​
				frequencies.put(kmer,​ ​1); 
​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​​	} ​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​
		else ​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​
		{ ​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ 
			​if(frequencies.containsKey(rkmer)) ​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​
				frequencies.replace(rkmer,​ ​frequencies.get(rkmer),​ ​frequencies.get(rkmer)+1); ​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​
			else ​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ 
				​frequencies.put(rkmer,​ ​1); ​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​
		} ​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ 
		​kmer​ ​=​ ​""; ​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ 
	​	rkmer​ ​=​ ​""; ​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​
	} ​ ​​ ​​ ​​ 
​}   ​ ​​ ​​ ​​ ​
public​ ​String​ ​computeReverseComplements() ​ ​​ ​​ ​​ ​
{ ​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​
	String​ ​rkmer; ​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​
	rkmer​ ​=​ ​sequence.replaceAll("A",​ ​"X"); ​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​
	rkmer​ ​=​ ​rkmer.replaceAll("T",​ ​"A"); ​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​
	rkmer​ ​=​ ​rkmer.replaceAll("X",​ ​"T"); ​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​
	rkmer​ ​=​ ​rkmer.replaceAll("C",​ ​"X"); ​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ 
	​rkmer​ ​=​ ​rkmer.replaceAll("G",​ ​"C"); ​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ 
	​rkmer​ ​=​ ​rkmer.replaceAll("X",​ ​"G"); ​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ 
	​rkmer​ ​=​ ​new​ ​StringBuffer(rkmer).reverse().toString(); ​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​
	return​ ​rkmer; ​ ​​ ​​ ​​ ​
} 
public​ ​void​ ​calculateY(int​ ​min,​ ​int​ ​max,​ ​Hashtable<String,​ ​Integer>​ ​frequencies,​ ​int[]​ ​y) 
{ 
	List<String>​ ​keys2​ ​=​ ​new​ ​ArrayList<String>(frequencies.keySet()); 
	for(int​ ​i​ ​=​ ​min;​ ​i​ ​<​ ​max+1;​ ​i++) 
	{ 
		for(String​ ​key:​ ​keys2) if(frequencies.get(key)​ ​==​ ​i) y[i-min]++; 
	} 
} 
%> 
<% 
File​ ​f​ ​=​ ​new​ ​File("C:/data/"​ ​+​ ​request.getParameter("file")); 
FileReader​ ​fread; 
BufferedReader​ ​bread; 
String​ ​line​ ​=​ ​""; 
sequence​ ​=​ ​""; 
int​ ​k​ ​=​ ​Integer.parseInt(request.getParameter("k")); 
Hashtable<String,​ ​Integer>​ ​frequencies​ ​=​ ​new​ ​Hashtable<String,​ ​Integer>(); 
try ​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​
{ ​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​
	fread​ ​=​ ​new​ ​FileReader(f); ​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ 
	​bread​ ​=​ ​new​ ​BufferedReader(fread); ​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ 
	​line​ ​=​ ​bread.readLine(); ​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​
	while(!((line​ ​=​ ​bread.readLine())​ ​==​ ​null)) ​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​
	{ ​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​
		if(line.contains(">")) ​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ 
			​sequence​ ​=​ ​""; ​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ 
		​else ​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​
		{ ​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​
			sequence​ ​+=​ ​line; ​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ 
			​listKmers(k,​ ​frequencies); ​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​
			sequence​ ​=​ ​sequence.substring(sequence.length()-k+1,​ ​sequence.length()); ​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ 
	​	} ​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​
	}   ​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​
	fread.close(); ​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ 
	​bread.close(); ​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​
}catch(Exception​ ​e) ​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​
{ ​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​
//out.println("Failure"); ​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​​ ​
} 
int​ ​min​ ​=​ ​Integer.parseInt(request.getParameter("min")); 
int​ ​max​ ​=​ ​Integer.parseInt(request.getParameter("max")); 
int[]​ ​y​ ​=​ ​new​ ​int[max-min+1]; calculateY(min,​ ​max,​ ​frequencies,​ ​y); 
for(int​ ​x:​ ​y) out.println(x); 
%> 