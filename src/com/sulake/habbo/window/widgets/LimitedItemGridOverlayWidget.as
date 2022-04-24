// by nota

//com.sulake.habbo.window.widgets.LimitedItemGridOverlayWidget

package com.sulake.habbo.window.widgets
{
    import com.sulake.core.runtime._SafeStr_41;
    import com.sulake.core.window.components._SafeStr_3199;
    import com.sulake.habbo.window.HabboWindowManagerComponent;
    import com.sulake.core.window._SafeStr_3133;
    import flash.display.BitmapData;
    import com.sulake.core.window.components._SafeStr_3264;
    import flash.utils.getTimer;
    import com.sulake.habbo.window.utils._SafeStr_3422;
    import com.sulake.core.window.iterators.EmptyIterator;
    import com.sulake.core.window.utils.IIterator;
    import flash.geom.Rectangle;
    import flash.geom.Point;

    public class LimitedItemGridOverlayWidget implements ILimitedItemGridOverlayWidget, _SafeStr_41 
    {

        public static const TYPE:String = "limited_item_overlay_grid";

        private const SHINE_INTERVAL_MS:uint = 10000;
        private const SHINE_LENGTH_MS:uint = 250;

        private var _disposed:Boolean = false;
        private var _SafeStr_5427:_SafeStr_3199;
        private var _windowManager:HabboWindowManagerComponent;
        private var _SafeStr_5428:_SafeStr_3133;
        private var _SafeStr_5853:BitmapData;
        private var _SafeStr_5852:_SafeStr_3264;
        private var _serialNumber:int;
        private var _SafeStr_5851:uint = getTimer();
        private var _SafeStr_5855:uint = _SafeStr_5851;
        private var _SafeStr_5854:Boolean = false;

        public function LimitedItemGridOverlayWidget(_arg_1:_SafeStr_3199, _arg_2:HabboWindowManagerComponent)
        {
            _SafeStr_5427 = _arg_1;
            _windowManager = _arg_2;
            _SafeStr_5853 = BitmapData(_windowManager.assets.getAssetByName("unique_item_label_plaque_metal").content).clone();
            _SafeStr_5428 = _SafeStr_3133(_windowManager.buildFromXML(XML(_windowManager.assets.getAssetByName("unique_item_overlay_griditem_xml").content)));
            _SafeStr_5852 = _SafeStr_3264(_SafeStr_5428.findChildByName("unique_item_overlay_plaque_background_bitmap"));
            _SafeStr_5852.bitmap = _SafeStr_5853;
            _SafeStr_5427.rootWindow = _SafeStr_5428;
        }

        public function dispose():void
        {
            if (!disposed)
            {
                if (_SafeStr_5854)
                {
                    _windowManager.removeUpdateReceiver(this);
                };
                if (_SafeStr_5427 != null)
                {
                    _SafeStr_5427.rootWindow = null;
                    _SafeStr_5427 = null;
                };
                if (_SafeStr_5428 != null)
                {
                    _SafeStr_5428.dispose();
                    _SafeStr_5428 = null;
                };
                _windowManager = null;
                _disposed = true;
            };
        }

        public function get disposed():Boolean
        {
            return (_disposed);
        }

        public function set serialNumber(_arg_1:int):void
        {
            _serialNumber = _arg_1;
            var _local_2:_SafeStr_3264 = _SafeStr_3264(_SafeStr_5428.findChildByName("unique_item_overlay_plaque_number_bitmap"));
            _local_2.bitmap = _SafeStr_3422.createBitmap(_windowManager.assets, serialNumber, _local_2.width, _local_2.height);
        }

        public function set seriesSize(_arg_1:int):void
        {
        }

        public function get serialNumber():int
        {
            return (_serialNumber);
        }

        public function get seriesSize():int
        {
            return (0);
        }

        public function get properties():Array
        {
            return ([]);
        }

        public function set properties(_arg_1:Array):void
        {
        }

        public function get iterator():IIterator
        {
            return (EmptyIterator.INSTANCE);
        }

        public function get animated():Boolean
        {
            return (_SafeStr_5854);
        }

        public function set animated(_arg_1:Boolean):void
        {
            _SafeStr_5854 = _arg_1;
            if (_SafeStr_5854)
            {
                _windowManager.registerUpdateReceiver(this, 5);
            }
            else
            {
                _windowManager.removeUpdateReceiver(this);
            };
        }

        public function update(_arg_1:uint):void
        {
            var _local_2:* = null;
            var _local_3:Number;
            var _local_4:int;
            if (!disposed)
            {
                _SafeStr_5851 = (_SafeStr_5851 + _arg_1);
                if ((_SafeStr_5851 - _SafeStr_5855) > 10000)
                {
                    _local_2 = new BitmapData(_SafeStr_5852.width, _SafeStr_5852.height, false);
                    _local_3 = (((_SafeStr_5851 - _SafeStr_5855) - 10000) / 250);
                    if (_local_3 < 1)
                    {
                        _local_4 = ((_SafeStr_5853.height - _SafeStr_5852.height) * _local_3);
                        _local_2.copyPixels(_SafeStr_5853, new Rectangle(0, _local_4, _SafeStr_5852.width, _SafeStr_5852.height), new Point(0, 0));
                        _SafeStr_5852.bitmap = _local_2;
                    }
                    else
                    {
                        _SafeStr_5852.bitmap = _SafeStr_5853;
                        _SafeStr_5855 = _SafeStr_5851;
                    };
                };
            };
        }


    }
}//package com.sulake.habbo.window.widgets

// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3199 = "_-Z1u" (String#359, DoABC#4)
// _SafeStr_3264 = "_-p1I" (String#104, DoABC#4)
// _SafeStr_3422 = "_-F17" (String#10862, DoABC#4)
// _SafeStr_41 = "_-m5" (String#2087, DoABC#4)
// _SafeStr_5427 = "_-h1n" (String#409, DoABC#4)
// _SafeStr_5428 = "_-L19" (String#253, DoABC#4)
// _SafeStr_5851 = "_-S1f" (String#7578, DoABC#4)
// _SafeStr_5852 = "_-I1t" (String#6944, DoABC#4)
// _SafeStr_5853 = "_-R1L" (String#10491, DoABC#4)
// _SafeStr_5854 = "_-P1v" (String#12061, DoABC#4)
// _SafeStr_5855 = "_-Ky" (String#11242, DoABC#4)


