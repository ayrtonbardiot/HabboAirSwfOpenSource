// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.core.assets.UnknownAsset

package com.sulake.core.assets
{
    import flash.utils.getQualifiedClassName;

    public class UnknownAsset implements IAsset 
    {

        private var _disposed:Boolean = false;
        private var _content:Object = null;
        private var _SafeStr_8024:AssetTypeDeclaration;
        private var _SafeStr_5275:String;

        public function UnknownAsset(_arg_1:AssetTypeDeclaration, _arg_2:String=null)
        {
            _SafeStr_8024 = _arg_1;
            _SafeStr_5275 = _arg_2;
        }

        public function get url():String
        {
            return (_SafeStr_5275);
        }

        public function get content():Object
        {
            return (_content);
        }

        public function get disposed():Boolean
        {
            return (_disposed);
        }

        public function get declaration():AssetTypeDeclaration
        {
            return (_SafeStr_8024);
        }

        public function dispose():void
        {
            if (!_disposed)
            {
                _disposed = true;
                _content = null;
                _SafeStr_8024 = null;
                _SafeStr_5275 = null;
            };
        }

        public function setUnknownContent(_arg_1:Object):void
        {
            _content = _arg_1;
        }

        public function setFromOtherAsset(_arg_1:IAsset):void
        {
            _content = (_arg_1.content as Object);
        }

        public function setParamsDesc(_arg_1:XMLList):void
        {
        }

        public function toString():String
        {
            return ((getQualifiedClassName(this) + ": ") + _content);
        }


    }
}//package com.sulake.core.assets

// _SafeStr_5275 = "_-J1N" (String#7775, DoABC#3)
// _SafeStr_8024 = "_-p0" (String#9968, DoABC#3)


