<cfscript>
    if (structKeyExists(form, "id")){
        queryExecute(
            "DELETE FROM blog WHERE id = :id",
            {id: form.id},
            {datasource: "cfblog"}
        );
        location("/blog/blogmain.cfm", false);
    }
</cfscript>