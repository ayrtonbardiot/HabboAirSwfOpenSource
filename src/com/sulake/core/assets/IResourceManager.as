// by nota

//com.sulake.core.assets.IResourceManager

package com.sulake.core.assets
{
    import com.sulake.core.runtime._SafeStr_13;

    public /*dynamic*/ interface IResourceManager extends _SafeStr_13 
    {

        function createAsset(_arg_1:String, _arg_2:Class, _arg_3:Object):IAsset;
        function retrieveAsset(_arg_1:String, _arg_2:_SafeStr_3346):void;
        function isSameAsset(_arg_1:String, _arg_2:String):Boolean;
        function removeAsset(_arg_1:String):void;

    }
}//package com.sulake.core.assets

// _SafeStr_13 = "_-P1N" (String#326, DoABC#4)
// _SafeStr_3346 = "_-p1W" (String#8896, DoABC#4)


