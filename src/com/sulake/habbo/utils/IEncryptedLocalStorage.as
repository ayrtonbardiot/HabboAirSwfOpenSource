// by nota

//com.sulake.habbo.utils.IEncryptedLocalStorage

package com.sulake.habbo.utils
{
    public /*dynamic*/ interface IEncryptedLocalStorage 
    {

        function reset():void;
        function storeString(_arg_1:String, _arg_2:String):Boolean;
        function restoreString(_arg_1:String):String;

    }
}//package com.sulake.habbo.utils

