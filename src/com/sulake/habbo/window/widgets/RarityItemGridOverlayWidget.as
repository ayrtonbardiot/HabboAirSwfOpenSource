// by nota

//com.sulake.habbo.window.widgets.RarityItemGridOverlayWidget

package com.sulake.habbo.window.widgets
{
    import com.sulake.core.window.components._SafeStr_3199;
    import com.sulake.habbo.window.HabboWindowManagerComponent;
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.core.window.components.IStaticBitmapWrapperWindow;
    import com.sulake.core.window.components._SafeStr_3264;
    import com.sulake.habbo.window.utils._SafeStr_3422;
    import com.sulake.core.window.iterators.EmptyIterator;
    import com.sulake.core.window.utils.IIterator;

    public class RarityItemGridOverlayWidget implements IRarityItemGridOverlayWidget 
    {

        public static const TYPE:String = "rarity_item_overlay_grid";

        private var _SafeStr_5427:_SafeStr_3199;
        private var _windowManager:HabboWindowManagerComponent;
        private var _disposed:Boolean;
        private var _SafeStr_5428:_SafeStr_3133;
        private var _SafeStr_5609:int;
        private var _SafeStr_9183:IStaticBitmapWrapperWindow;

        public function RarityItemGridOverlayWidget(_arg_1:_SafeStr_3199, _arg_2:HabboWindowManagerComponent)
        {
            _SafeStr_5427 = _arg_1;
            _windowManager = _arg_2;
            _SafeStr_5428 = _SafeStr_3133(_windowManager.buildFromXML(XML(_windowManager.assets.getAssetByName("rarity_item_overlay_griditem_xml").content)));
            _SafeStr_5427.rootWindow = _SafeStr_5428;
        }

        public function get disposed():Boolean
        {
            return (_disposed);
        }

        public function set rarityLevel(_arg_1:int):void
        {
            _SafeStr_5609 = _arg_1;
            var _local_2:_SafeStr_3264 = _SafeStr_3264(_SafeStr_5428.findChildByName("rarity_item_overlay_plaque_number_bitmap"));
            _local_2.bitmap = _SafeStr_3422.createBitmap(_windowManager.assets, rarityLevel, _local_2.width, _local_2.height);
        }

        public function get rarityLevel():int
        {
            return (_SafeStr_5609);
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
// _SafeStr_5609 = "_-l1V" (String#3326, DoABC#4)
// _SafeStr_9183 = "_-116" (String#34728, DoABC#4)


