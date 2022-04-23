// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.core.assets.IAsset

package com.sulake.core.assets
{
    import com.sulake.core.runtime._SafeStr_13;

    public /*dynamic*/ interface IAsset extends _SafeStr_13 
    {

        function get url():String;
        function get content():Object;
        function get declaration():AssetTypeDeclaration;
        function setUnknownContent(_arg_1:Object):void;
        function setFromOtherAsset(_arg_1:IAsset):void;
        function setParamsDesc(_arg_1:XMLList):void;

    }
}//package com.sulake.core.assets

// _SafeStr_13 = "_-P1N" (String#8235, DoABC#3)


