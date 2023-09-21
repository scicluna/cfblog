<cfscript>
    blogPosts = queryExecute(
        "
        SELECT
            *
        FROM
            blog
        ORDER BY
            date DESC;
        ",
        {},
        {datasource: "cfblog"}
    )
</cfscript>

<html>
    <head>
        <link href="/blog/ostyles.css" rel="stylesheet" />
    </head>
    <body class="h-[100dvh] w-full bg-slate-200 flex flex-col items-center">
        <nav class="w-full h-[10dvh] bg-slate-400 bg-opacity-80 flex justify-between items-center font-extrabold text-5xl p-4">
            <a href="/blog/blogmain.cfm">GENERIC BLOG</a>
            <a href="/blog/pages/newpost.cfm" class="bg-slate-500 hover:bg-slate-400 transition-all rounded-full p-2">NEW POST</a>
        </nav>
        <cfoutput>
            <section class="sm:w-3/4 w-full h-full flex flex-col gap-10 p-4 ">
                <cfif blogPosts.recordCount gt 0>
                    <cfloop query="blogPosts">
                        <div class="flex flex-col">
                            <h1>#blogPosts.title#</h1>
                            <div class="flex justify-between">
                                <div class="flex gap-4">
                                    <h4>#blogPosts.date#</h4>
                                    <h4>#blogPosts.category#</h4>
                                </div>
                                <div class="flex gap-4">
                                    <form action="./pages/editpost.cfm" method="GET">
                                        <input name="id" type="hidden" value="#blogPosts.id#"/>
                                        <button type="submit">Edit</button>
                                    </form>
                                    <form action="./pages/deletepost.cfm" method="POST">
                                        <input name="id" type="hidden" value="#blogPosts.id#"/>
                                        <button type="submit">Delete</button>
                                    </form>
                                </div>
                            </div>
                            <div class="border border-slate-500 h-0"></div>
                            <p>#blogPosts.content#</p>
                        </div>
                        
                    </cfloop>
                <cfelse>
                    <p>No blog posts yet...</p>
                </cfif>
            </section> 
        </cfoutput>
    </body>
</html>