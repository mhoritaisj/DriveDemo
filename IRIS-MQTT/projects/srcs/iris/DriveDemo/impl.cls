/// Drive Demo: REST APIの定義<br/>
/// Business logic class defined by OpenAPI in DriveDemo.spec<br/>
/// Created Jul 27, 2019 00:18:32
Class DriveDemo.impl Extends %REST.Impl [ ProcedureBlock ]
{

/// If ExposeServerExceptions is true, then details of internal errors will be exposed.
Parameter ExposeServerExceptions = 0;

/// すべての車の情報を返す
ClassMethod getAllCars() As %DynamicObject
{
    //(Place business logic here)
    //Do ..%SetStatusCode(<HTTP_status_code>)
    //Do ..%SetHeader(<name>,<value>)
    //Quit (Place response here) ; response may be a string, stream or dynamic object
}

}
