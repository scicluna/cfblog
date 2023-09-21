<cfscript>
    if (structKeyExists(form, "category") && structKeyExists(form, "title") && structKeyExists(form, "content")) {
        queryExecute(
            "INSERT INTO blog (category, date, title, content) VALUES (:category, NOW(), :title, :content)",
            {
                category: form.category,
                title: form.title,
                content: form.content
            },
            {datasource: "cfblog"}
        );
        location("/blog/blogmain.cfm", false)
    }
</cfscript>

<html>
    <head>
        <link href="/blog/ostyles.css" rel="stylesheet" />
    </head>
    <body class="h-[100dvh] w-full bg-slate-200 flex flex-col items-center gap-10">
        <nav class="w-full h-[10dvh] bg-slate-400 bg-opacity-80 flex justify-between items-center font-extrabold text-5xl p-4">
            <a href="/blog/blogmain.cfm">GENERIC BLOG</a>
            <a href="/blog/pages/newpost.cfm" class="bg-slate-500 hover:bg-slate-400 transition-all rounded-full p-2">NEW POST</a>
        </nav>
        <form class="sm:w-3/4 w-full h-full flex flex-col gap-4 p-4 items-center" action="newpost.cfm" method="POST">
            <div class="flex flex-col w-full items-center">
                <label for="category">Category</label>
                <input name="category" class="w-1/4 p-2 rounded-md"/>
            </div>
            <div class="flex flex-col w-full items-center">
                <label for="title">Title</label>
                <input name ="title" class="w-1/4 p-2 rounded-md"/>
            </div>
            <textarea name="content" placeholder="content goes here..." rows="15" class="w-full p-2 rounded-md"></textarea>
            <button class="bg-slate-500 hover:bg-slate-400 transition-all rounded-full p-2 text-2xl" type="submit">Submit</button>
        </form> 
    </body>
</html>
