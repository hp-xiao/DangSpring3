/*
* Copyright 2004 The Apache Software Foundation
*
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
*     http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/

package com.icss.filter;


import java.io.IOException;
import java.util.Enumeration;
import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.annotation.WebInitParam;
import jakarta.servlet.http.HttpServletRequest; 

@WebFilter(urlPatterns="/*",
		   initParams={@WebInitParam(name="encoding",value="utf-8")})
public class CharacterEncodingFilter implements Filter {

    private String encoding; //��Ա���������ڽ��ձ����������

    public void destroy() {
        this.encoding = null;
    }
   
    public void doFilter(ServletRequest request, ServletResponse response,
                         FilterChain chain) throws IOException, ServletException {       
        if (encoding != null)
            request.setCharacterEncoding(encoding);
        HttpServletRequest r = (HttpServletRequest)request;
        if(r.getMethod().equalsIgnoreCase("get")){
        	Enumeration<?> names = request.getParameterNames();
            while (names.hasMoreElements()){
                String[] values = request.getParameterValues(names.nextElement().toString());
                for (int i = 0; i < values.length; ++i){
                    values[i] = new String(values[i].getBytes("ISO-8859-1"), encoding );               
                }
            }        	
        }        
        chain.doFilter(request, response);
    }


    /**
     * Place this filter into service.
     *
     * @param filterConfig The filter configuration object
     */
    public void init(FilterConfig filterConfig) throws ServletException {
        this.encoding = filterConfig.getInitParameter("encoding");
    }


    // ------------------------------------------------------ Protected Methods





}
