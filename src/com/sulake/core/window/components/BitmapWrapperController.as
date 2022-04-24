// by nota

//com.sulake.core.window.components.BitmapWrapperController

package com.sulake.core.window.components
{
    import com.sulake.core.window.utils._SafeStr_3250;
    import com.sulake.core.window.WindowContext;
    import flash.geom.Rectangle;
    import com.sulake.core.window._SafeStr_3109;
    import flash.display.BitmapData;
    import com.sulake.core.window.utils.PropertyStruct;

    public class BitmapWrapperController extends BitmapDataController implements _SafeStr_3264, _SafeStr_3250 
    {

        protected var _SafeStr_6431:Boolean;
        protected var _bitmapAssetName:String;

        public function BitmapWrapperController(_arg_1:String, _arg_2:uint, _arg_3:uint, _arg_4:uint, _arg_5:WindowContext, _arg_6:Rectangle, _arg_7:_SafeStr_3109, _arg_8:Function=null, _arg_9:Array=null, _arg_10:Array=null, _arg_11:uint=0)
        {
            _SafeStr_6431 = _arg_5.getWindowFactory().getThemeManager().getPropertyDefaults(_arg_3).get("handle_bitmap_disposing");
            super(_arg_1, _arg_2, _arg_3, _arg_4, _arg_5, _arg_6, _arg_7, _arg_8, _arg_9, _arg_10, _arg_11);
        }

        public function get bitmap():BitmapData
        {
            return (_bitmapData);
        }

        public function set bitmap(_arg_1:BitmapData):void
        {
            if ((((_SafeStr_6431) && (_bitmapData)) && (!(_arg_1 == _bitmapData))))
            {
                _bitmapData.dispose();
            };
            _bitmapData = _arg_1;
            fitSize();
            _context.invalidate(this, null, 1);
        }

        public function set bitmapData(_arg_1:BitmapData):void
        {
            bitmap = _arg_1;
        }

        public function get bitmapAssetName():String
        {
            return (_bitmapAssetName);
        }

        public function set bitmapAssetName(_arg_1:String):void
        {
            _bitmapAssetName = _arg_1;
        }

        public function get disposesBitmap():Boolean
        {
            return (_SafeStr_6431);
        }

        public function set disposesBitmap(_arg_1:Boolean):void
        {
            _SafeStr_6431 = _arg_1;
        }

        override public function clone():_SafeStr_3109
        {
            var _local_1:BitmapWrapperController = (super.clone() as BitmapWrapperController);
            _local_1._bitmapData = (((_SafeStr_6431) && (_bitmapData)) ? _bitmapData.clone() : _bitmapData);
            _local_1._SafeStr_6431 = _SafeStr_6431;
            _local_1._bitmapAssetName = _bitmapAssetName;
            return (_local_1);
        }

        override public function dispose():void
        {
            if (_bitmapData)
            {
                if (_SafeStr_6431)
                {
                    _bitmapData.dispose();
                };
                _bitmapData = null;
            };
            super.dispose();
        }

        override public function get properties():Array
        {
            var _local_1:Array = super.properties;
            _local_1.unshift(createProperty("handle_bitmap_disposing", _SafeStr_6431));
            _local_1.unshift(createProperty("bitmap_asset_name", _bitmapAssetName));
            return (_local_1);
        }

        override public function set properties(_arg_1:Array):void
        {
            for each (var _local_2:PropertyStruct in _arg_1)
            {
                switch (_local_2.key)
                {
                    case "handle_bitmap_disposing":
                        _SafeStr_6431 = (_local_2.value as Boolean);
                        break;
                    case "bitmap_asset_name":
                        _bitmapAssetName = (_local_2.value as String);
                };
            };
            super.properties = _arg_1;
        }


    }
}//package com.sulake.core.window.components

// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3250 = "_-J1u" (String#3192, DoABC#4)
// _SafeStr_3264 = "_-p1I" (String#104, DoABC#4)
// _SafeStr_6431 = "_-z1v" (String#5447, DoABC#4)


