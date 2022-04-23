// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.window.widgets.HoverBitmapWidget

package com.sulake.habbo.window.widgets
{
    import com.sulake.core.window.utils.PropertyStruct;
    import com.sulake.core.window.components._SafeStr_3199;
    import com.sulake.habbo.window.HabboWindowManagerComponent;
    import com.sulake.core.window.components.IStaticBitmapWrapperWindow;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.iterators.EmptyIterator;
    import com.sulake.core.window.utils.IIterator;

    public class HoverBitmapWidget implements _SafeStr_3307 
    {

        public static const TYPE:String = "hover_bitmap";
        private static const _SafeStr_9177:String = "hover_bitmap:hover_asset";
        private static const _SafeStr_9178:String = "hover_bitmap:normal_asset";
        private static const HOVER_ASSET_DEFAULT:PropertyStruct = new PropertyStruct("hover_bitmap:hover_asset", null, "String");
        private static const NORMAL_ASSET_DEFAULT:PropertyStruct = new PropertyStruct("hover_bitmap:normal_asset", null, "String");

        private var _disposed:Boolean;
        private var _SafeStr_5427:_SafeStr_3199;
        private var _windowManager:HabboWindowManagerComponent;
        private var _bitmap:IStaticBitmapWrapperWindow;
        private var _normalAsset:String;
        private var _hoverAsset:String;
        private var _SafeStr_5726:Boolean = false;

        public function HoverBitmapWidget(_arg_1:_SafeStr_3199, _arg_2:HabboWindowManagerComponent)
        {
            _SafeStr_5427 = _arg_1;
            _windowManager = _arg_2;
            _bitmap = (_windowManager.buildFromXML((_windowManager.assets.getAssetByName("hover_bitmap_xml").content as XML)) as IStaticBitmapWrapperWindow);
            _bitmap.addEventListener("WME_OVER", onMouseOver);
            _bitmap.addEventListener("WME_OUT", onMouseOut);
            _SafeStr_5427.rootWindow = _bitmap;
            _bitmap.width = _SafeStr_5427.width;
            _bitmap.height = _SafeStr_5427.height;
            _bitmap.invalidate();
        }

        private function onMouseOver(_arg_1:WindowMouseEvent):void
        {
            _SafeStr_5726 = true;
            _bitmap.assetUri = _hoverAsset;
        }

        private function onMouseOut(_arg_1:WindowMouseEvent):void
        {
            _SafeStr_5726 = false;
            _bitmap.assetUri = _normalAsset;
        }

        public function dispose():void
        {
            if (!_disposed)
            {
                if (_bitmap != null)
                {
                    _bitmap.dispose();
                    _bitmap = null;
                };
                _SafeStr_5427.rootWindow = null;
                _SafeStr_5427 = null;
                _windowManager = null;
            };
        }

        public function get disposed():Boolean
        {
            return (_disposed);
        }

        public function get iterator():IIterator
        {
            return (EmptyIterator.INSTANCE);
        }

        public function get properties():Array
        {
            var _local_2:Array = [];
            if (_disposed)
            {
                return (_local_2);
            };
            _local_2.push(NORMAL_ASSET_DEFAULT.withValue(_normalAsset));
            _local_2.push(HOVER_ASSET_DEFAULT.withValue(_hoverAsset));
            if (_bitmap != null)
            {
                for each (var _local_1:PropertyStruct in _bitmap.properties)
                {
                    if (_local_1.key != "asset_uri")
                    {
                        _local_2.push(_local_1);
                    };
                };
            };
            return (_local_2);
        }

        public function set properties(_arg_1:Array):void
        {
            if (_disposed)
            {
                return;
            };
            for each (var _local_2:PropertyStruct in _arg_1)
            {
                switch (_local_2.key)
                {
                    case "hover_bitmap:normal_asset":
                        normalAsset = _local_2.value;
                        break;
                    case "hover_bitmap:hover_asset":
                        hoverAsset = _local_2.value;
                };
            };
            if (_bitmap != null)
            {
                _bitmap.properties = _arg_1;
                _bitmap.invalidate();
            };
        }

        public function get normalAsset():String
        {
            return (_normalAsset);
        }

        public function set normalAsset(_arg_1:String):void
        {
            _normalAsset = _arg_1;
            if (!_SafeStr_5726)
            {
                _bitmap.assetUri = _normalAsset;
            };
        }

        public function get hoverAsset():String
        {
            return (_hoverAsset);
        }

        public function set hoverAsset(_arg_1:String):void
        {
            _hoverAsset = _arg_1;
            if (_SafeStr_5726)
            {
                _bitmap.assetUri = _hoverAsset;
            };
        }

        public function get bitmapWrapper():IStaticBitmapWrapperWindow
        {
            return (_bitmap);
        }


    }
}//package com.sulake.habbo.window.widgets

// _SafeStr_3199 = "_-Z1u" (String#359, DoABC#4)
// _SafeStr_3307 = "_-12G" (String#20716, DoABC#4)
// _SafeStr_5427 = "_-h1n" (String#409, DoABC#4)
// _SafeStr_5726 = "_-x7" (String#11057, DoABC#4)
// _SafeStr_9177 = "_-7e" (String#38524, DoABC#4)
// _SafeStr_9178 = "_-l3" (String#32492, DoABC#4)


