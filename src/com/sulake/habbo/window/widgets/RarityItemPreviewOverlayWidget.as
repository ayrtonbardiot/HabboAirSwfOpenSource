// by nota

//com.sulake.habbo.window.widgets.RarityItemPreviewOverlayWidget

package com.sulake.habbo.window.widgets
{
    import com.sulake.core.window.utils.PropertyStruct;
    import com.sulake.core.window.components._SafeStr_3199;
    import com.sulake.habbo.window.HabboWindowManagerComponent;
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.core.window.components.ITextWindow;
    import com.sulake.core.window.iterators.EmptyIterator;
    import com.sulake.core.window.utils.IIterator;

    public class RarityItemPreviewOverlayWidget implements IRarityItemPreviewOverlayWidget 
    {

        public static const TYPE:String = "rarity_item_overlay_preview";
        private static const _SafeStr_9184:String = "rarity_item_overlay_preview:level";
        private static const RARITY_LEVEL_DEFAULT:PropertyStruct = new PropertyStruct("rarity_item_overlay_preview:level", 0, "int");

        private var _SafeStr_5427:_SafeStr_3199;
        private var _windowManager:HabboWindowManagerComponent;
        private var _SafeStr_5428:_SafeStr_3133;
        private var _SafeStr_5609:int;
        private var _disposed:Boolean;
        private var _SafeStr_5608:ITextWindow;

        public function RarityItemPreviewOverlayWidget(_arg_1:_SafeStr_3199, _arg_2:HabboWindowManagerComponent)
        {
            _SafeStr_5427 = _arg_1;
            _windowManager = _arg_2;
            _SafeStr_5428 = _SafeStr_3133(_windowManager.buildFromXML(XML(_windowManager.assets.getAssetByName("rarity_item_overlay_preview_xml").content)));
            _SafeStr_5608 = (_SafeStr_5428.findChildByName("level") as ITextWindow);
            _SafeStr_5427.rootWindow = _SafeStr_5428;
        }

        public function set rarityLevel(_arg_1:int):void
        {
            _SafeStr_5609 = _arg_1;
            _SafeStr_5608.caption = _arg_1.toString();
        }

        public function get rarityLevel():int
        {
            return (_SafeStr_5609);
        }

        public function get properties():Array
        {
            var _local_1:Array = [];
            if (_disposed)
            {
                return (_local_1);
            };
            _local_1.push(RARITY_LEVEL_DEFAULT.withValue(rarityLevel));
            return (_local_1);
        }

        public function set properties(_arg_1:Array):void
        {
            for each (var _local_2:PropertyStruct in _arg_1)
            {
                switch (_local_2.key)
                {
                    case "rarity_item_overlay_preview:level":
                        rarityLevel = _local_2.value;
                };
            };
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
            _disposed = true;
        }

        public function get disposed():Boolean
        {
            return (_disposed);
        }

        public function get iterator():IIterator
        {
            return (EmptyIterator.INSTANCE);
        }


    }
}//package com.sulake.habbo.window.widgets

// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3199 = "_-Z1u" (String#359, DoABC#4)
// _SafeStr_5427 = "_-h1n" (String#409, DoABC#4)
// _SafeStr_5428 = "_-L19" (String#253, DoABC#4)
// _SafeStr_5608 = "_-2P" (String#22419, DoABC#4)
// _SafeStr_5609 = "_-l1V" (String#3326, DoABC#4)
// _SafeStr_9184 = "_-9d" (String#38730, DoABC#4)


