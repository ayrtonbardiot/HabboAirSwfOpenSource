// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.session.product.ProductDataParser

package com.sulake.habbo.session.product
{
    import com.sulake.core.runtime.events.EventDispatcherWrapper;
    import flash.utils.Dictionary;
    import com.sulake.core.assets.AssetLibrary;
    import flash.net.URLRequest;
    import com.sulake.core.assets.AssetLoaderStruct;
    import flash.utils.ByteArray;
    import flash.events.Event;
    import com.sulake.core._SafeStr_79;
    import com.sulake.habbo.utils.HabboWebTools;
    import com.sulake.core.assets.loaders.AssetLoaderEvent;

    public class ProductDataParser extends EventDispatcherWrapper 
    {

        public static const READY:String = "PDP_product_data_ready";

        private var _SafeStr_3814:Dictionary;
        private var _SafeStr_4901:AssetLibrary;

        public function ProductDataParser(_arg_1:String, _arg_2:Dictionary, _arg_3:String=null, _arg_4:String=null)
        {
            var _local_5:* = null;
            super();
            _SafeStr_3814 = _arg_2;
            _SafeStr_4901 = new AssetLibrary("ProductDataParserAssetLib");
            if (((_arg_3) && (_arg_4)))
            {
                _local_5 = _SafeStr_4901.loadAssetFromFile("productdata", new URLRequest(_arg_1), "text/plain", ("productdata_" + _arg_4.toLowerCase()), _arg_3);
            }
            else
            {
                _local_5 = _SafeStr_4901.loadAssetFromFile("productdata", new URLRequest(_arg_1), "text/plain");
            };
            _local_5.addEventListener("AssetLoaderEventComplete", parseProductsData);
            _local_5.addEventListener("AssetLoaderEventError", productsDataError);
        }

        override public function dispose():void
        {
            super.dispose();
            if (_SafeStr_4901)
            {
                _SafeStr_4901.dispose();
                _SafeStr_4901 = null;
            };
            _SafeStr_3814 = null;
        }

        private function parseProductsData(_arg_1:Event):void
        {
            var _local_2:* = null;
            var _local_3:* = null;
            var _local_4:AssetLoaderStruct = (_arg_1.target as AssetLoaderStruct);
            if (_local_4 == null)
            {
                return;
            };
            if (((_local_4.assetLoader == null) || (_local_4.assetLoader.content == null)))
            {
                return;
            };
            if ((_local_4.assetLoader.content is ByteArray))
            {
                _local_3 = (_local_4.assetLoader.content as ByteArray);
                _local_3.position = 0;
                _local_2 = _local_3.readUTFBytes(_local_3.length);
            }
            else
            {
                _local_2 = (_local_4.assetLoader.content as String);
            };
            if (_local_2.charAt(0) == "<")
            {
                parseXmlFormat(_local_2);
            }
            else
            {
                parseLingoFormat(_local_2);
            };
        }

        private function parseXmlFormat(_arg_1:String):void
        {
            var _local_4:* = null;
            var _local_2:* = null;
            try
            {
                _local_4 = new XML(_arg_1);
            }
            catch(e:Error)
            {
                _SafeStr_79.error(("XML Product data was malformed: " + _arg_1), true, 7);
            };
            if (_local_4 == null)
            {
                return;
            };
            var _local_5:XMLList = _local_4.product;
            for each (var _local_3:XML in _local_5)
            {
                _local_2 = _local_3.@code;
                _SafeStr_3814[_local_2] = new ProductData(_local_2, _local_3.name);
            };
            dispatchEvent(new Event("PDP_product_data_ready"));
        }

        private function parseLingoFormat(_arg_1:String):void
        {
            var _local_5:* = null;
            var _local_12:* = null;
            var _local_10:* = null;
            var _local_6:* = null;
            var _local_2:* = null;
            var _local_3:RegExp = /\n\r{1,}|\n{1,}|\r{1,}/gm;
            var _local_4:RegExp = /\[+?((.)*?)\]/g;
            _arg_1 = _arg_1.replace(/"{1,}/gm, "");
            var _local_9:Array = _arg_1.split(_local_3);
            var _local_11:int;
            for each (var _local_8:String in _local_9)
            {
                _local_5 = _local_8.match(_local_4);
                for each (var _local_7:String in _local_5)
                {
                    _local_7 = _local_7.replace(/\[{1,}/gm, "");
                    _local_7 = _local_7.replace(/\]{1,}/gm, "");
                    _local_12 = _local_7.split(",");
                    _local_10 = _local_12.shift();
                    _local_6 = _local_12.shift();
                    _local_2 = new ProductData(_local_10, _local_6);
                    _SafeStr_3814[_local_10] = _local_2;
                };
                _local_11++;
            };
            dispatchEvent(new Event("PDP_product_data_ready"));
        }

        private function productsDataError(_arg_1:AssetLoaderEvent):void
        {
            HabboWebTools.logEventLog(("productdata download error " + _arg_1.status));
            _SafeStr_79.error("Could not download productdata", true, 7);
        }


    }
}//package com.sulake.habbo.session.product

// _SafeStr_3814 = "_-H1d" (String#3176, DoABC#4)
// _SafeStr_4901 = "_-1u" (String#4290, DoABC#4)
// _SafeStr_79 = "_-411" (String#2835, DoABC#4)


