package generatedtest;

import java.net.URI;
import java.util.List;
import org.apache.http.client.utils.URIBuilder;
import org.apache.http.client.utils.URLEncodedUtils;

// Test case generated by GenerateFlowTestCase.ql
public class Client {

	<T> T getElement(Iterable<T> it) {
		return it.iterator().next();
	}

	Object getURIBuilder_pathDefault(Object container) {
		return null;
	}

	Object taint() {
		return null;
	}

	void sink(Object o) {}

	public void test() throws Exception {

		{
			// "org.apache.http.client.utils;URIBuilder;true;URIBuilder;(String);;Argument[0];Argument[-1];taint;ai-generated"
			URIBuilder out = null;
			String in = (String) taint();
			out = new URIBuilder(in);
			sink(out); // $ hasTaintFlow
		}
		{
			// "org.apache.http.client.utils;URIBuilder;true;URIBuilder;(URI);;Argument[0];Argument[-1];taint;ai-generated"
			URIBuilder out = null;
			URI in = (URI) taint();
			out = new URIBuilder(in);
			sink(out); // $ hasTaintFlow
		}
		{
			// "org.apache.http.client.utils;URIBuilder;true;setHost;(String);;Argument[0];Argument[-1];taint;ai-generated"
			URIBuilder out = null;
			String in = (String) taint();
			out.setHost(in);
			sink(out); // $ hasTaintFlow
		}
		{
			// "org.apache.http.client.utils;URIBuilder;true;setHost;(String);;Argument[0];ReturnValue;taint;ai-generated"
			URIBuilder out = null;
			String in = (String) taint();
			URIBuilder instance = null;
			out = instance.setHost(in);
			sink(out); // $ hasTaintFlow
		}
		{
			// "org.apache.http.client.utils;URIBuilder;true;setPath;(String);;Argument[0];Argument[-1].SyntheticField[org.apache.http.client.utils.URIBuilder.path];taint;ai-generated"
			URIBuilder out = null;
			String in = (String) taint();
			out.setPath(in);
			sink(getURIBuilder_pathDefault(out)); // $ hasTaintFlow
		}
		{
			// "org.apache.http.client.utils;URIBuilder;true;setPathSegments;(List);;Argument[0];Argument[-1].SyntheticField[org.apache.http.client.utils.URIBuilder.path];taint;ai-generated"
			URIBuilder out = null;
			List in = (List) taint();
			out.setPathSegments(in);
			sink(getURIBuilder_pathDefault(out)); // $ hasTaintFlow
		}
		{
			// "org.apache.http.client.utils;URLEncodedUtils;true;parse;(URI,String);;Argument[0];ReturnValue.Element;taint;ai-generated"
			List out = null;
			URI in = (URI) taint();
			out = URLEncodedUtils.parse(in, (String) null);
			sink(getElement(out)); // $ hasTaintFlow
		}

	}

}
