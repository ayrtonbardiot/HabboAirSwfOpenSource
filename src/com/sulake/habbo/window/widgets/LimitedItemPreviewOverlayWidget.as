// by nota

//com.sulake.habbo.window.widgets.LimitedItemPreviewOverlayWidget

package com.sulake.habbo.window.widgets
{
    import com.sulake.core.window.components._SafeStr_3199;
    import com.sulake.habbo.window.HabboWindowManagerComponent;
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.core.window.components._SafeStr_3264;
    import com.sulake.habbo.window.utils._SafeStr_3422;
    import com.sulake.core.window.iterators.EmptyIterator;
    import com.sulake.core.window.utils.IIterator;

    public class LimitedItemPreviewOverlayWidget implements ILimitedItemPreviewOverlayWidget 
    {

        public static const TYPE:String = "limited_item_overlay_preview";

        private var _SafeStr_5427:_SafeStr_3199;
        private var _windowManager:HabboWindowManagerComponent;
        private var _SafeStr_5428:_SafeStr_3133;
        private var _serialNumber:int;
        private var _SafeStr_5430:int;

        public function LimitedItemPreviewOverlayWidget(_arg_1:_SafeStr_3199, _arg_2:HabboWindowManagerComponent)
        {
            _SafeStr_5427 = _arg_1;
            _windowManager = _arg_2;
            _SafeStr_5428 = _SafeStr_3133(_windowManager.buildFromXML(XML(_windowManager.assets.getAssetByName("unique_item_overlay_preview_xml").content)));
            _SafeStr_5427.rootWindow = _SafeStr_5428;
        }

        public function set serialNumber(_arg_1:int):void
        {
            _serialNumber = _arg_1;
            var _local_2:_SafeStr_3264 = _SafeStr_3264(_SafeStr_5428.findChildByName("unique_item_serial_number_bitmap"));
            _local_2.bitmap = _SafeStr_3422.createBitmap(_windowManager.assets, serialNumber, _local_2.width, _local_2.height);
        }

        public function set seriesSize(_arg_1:int):void
        {
            _SafeStr_5430 = _arg_1;
            var _local_2:_SafeStr_3264 = _SafeStr_3264(_SafeStr_5428.findChildByName("unique_item_edition_size_bitmap"));
            _local_2.bitmap = _SafeStr_3422.createBitmap(_windowManager.assets, _arg_1, _local_2.width, _local_2.height);
        }

        public function get serialNumber():int
        {
            return (_serialNumber);
        }

        public function get seriesSize():int
        {
            return (_SafeStr_5430);
        }

        public function get properties():Array
        {
            return ([]);
        }

        public function set properties(_arg_1:Array):void
        {
        }

        public function dispose():void
        {
            if (!disposed)
            {
                if (_SafeStr_5428 != null)
                {
                    _SafeStr_5428.dispose();
                    _SafeStr_5428 = null;
                };
            };
        }

        public function get disposed():Boolean
        {
            return (_SafeStr_5428 == null);
        }

        public function get iterator():IIterator
        {
            return (EmptyIterator.INSTANCE);
        }


    }
}//package com.sulake.habbo.window.widgets

// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3199 = "_-Z1u" (String#359, DoABC#4)
// _SafeStr_3264 = "_-p1I" (String#104, DoABC#4)
// _SafeStr_3422 = "_-F17" (String#10862, DoABC#4)
// _SafeStr_5427 = "_-h1n" (String#409, DoABC#4)
// _SafeStr_5428 = "_-L19" (String#253, DoABC#4)
// _SafeStr_5430 = "_-VH" (String#10124, DoABC#4)


