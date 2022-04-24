// by nota

//com.sulake.habbo.ui.widget.furniture.clothingchange.ClothingChangeFurnitureWidget

package com.sulake.habbo.ui.widget.furniture.clothingchange
{
    import com.sulake.habbo.ui.widget.RoomWidgetBase;
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.habbo.ui.IRoomWidgetHandler;
    import com.sulake.habbo.window._SafeStr_1695;
    import com.sulake.core.assets.IAssetLibrary;
    import com.sulake.habbo.localization._SafeStr_18;
    import flash.events.IEventDispatcher;
    import com.sulake.habbo.ui.widget.events.RoomWidgetClothingChangeUpdateEvent;
    import com.sulake.core.assets.IAsset;
    import com.sulake.core.assets.XmlAsset;
    import flash.geom.Rectangle;
    import com.sulake.core.window._SafeStr_3109;
    import com.sulake.core.window.events._SafeStr_3116;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetClothingChangeMessage;

    public class ClothingChangeFurnitureWidget extends RoomWidgetBase 
    {

        private static const _SafeStr_9014:String = "Boy";
        private static const _SafeStr_9015:String = "Girl";

        private var _SafeStr_5230:_SafeStr_3133;
        private var _SafeStr_4157:int = 0;
        private var _SafeStr_4750:int = 0;
        private var _SafeStr_3693:int = 0;

        public function ClothingChangeFurnitureWidget(_arg_1:IRoomWidgetHandler, _arg_2:_SafeStr_1695, _arg_3:IAssetLibrary=null, _arg_4:_SafeStr_18=null)
        {
            super(_arg_1, _arg_2, _arg_3, _arg_4);
        }

        override public function dispose():void
        {
            hideGenderSelectionInterface();
            super.dispose();
        }

        override public function registerUpdateEvents(_arg_1:IEventDispatcher):void
        {
            if (_arg_1 == null)
            {
                return;
            };
            _arg_1.addEventListener("RWCCUE_SHOW_GENDER_SELECTION", onUpdate);
            _arg_1.addEventListener("RWCCUE_SHOW_CLOTHING_EDITOR", onUpdate);
            super.registerUpdateEvents(_arg_1);
        }

        override public function unregisterUpdateEvents(_arg_1:IEventDispatcher):void
        {
            if (_arg_1 == null)
            {
                return;
            };
            _arg_1.removeEventListener("RWCCUE_SHOW_GENDER_SELECTION", onUpdate);
            _arg_1.removeEventListener("RWCCUE_SHOW_CLOTHING_EDITOR", onUpdate);
        }

        private function onUpdate(_arg_1:RoomWidgetClothingChangeUpdateEvent):void
        {
            switch (_arg_1.type)
            {
                case "RWCCUE_SHOW_GENDER_SELECTION":
                    showGenderSelectionInterface(_arg_1);
                    return;
            };
        }

        private function showGenderSelectionInterface(_arg_1:RoomWidgetClothingChangeUpdateEvent):void
        {
            hideGenderSelectionInterface();
            _SafeStr_4157 = _arg_1.objectId;
            _SafeStr_4750 = _arg_1.objectCategory;
            _SafeStr_3693 = _arg_1.roomId;
            var _local_4:IAsset = assets.getAssetByName("boygirl");
            var _local_2:XmlAsset = XmlAsset(_local_4);
            if (_local_2 == null)
            {
                return;
            };
            _SafeStr_5230 = (windowManager.createWindow("clothing change gender selection", "", 4, 0, (((0x8000 | 0x01) | 0x020000) | 0x01), new Rectangle(100, 100, 200, 200), null, 0) as _SafeStr_3133);
            _SafeStr_5230.buildFromXML(XML(_local_2.content));
            _SafeStr_5230.addEventListener("WME_CLICK", onGenderSelectionMouseEvent);
            _SafeStr_5230.center();
            var _local_3:_SafeStr_3109 = _SafeStr_5230.findChildByTag("close");
            if (_local_3 != null)
            {
                _local_3.procedure = onGenderSelectionWindowClose;
            };
            _local_3 = _SafeStr_5230.findChildByName("Boy");
            if (_local_3 != null)
            {
                _local_3.addEventListener("WME_CLICK", onGenderSelectionMouseEvent);
            };
            _local_3 = _SafeStr_5230.findChildByName("Girl");
            if (_local_3 != null)
            {
                _local_3.addEventListener("WME_CLICK", onGenderSelectionMouseEvent);
            };
        }

        private function hideGenderSelectionInterface():void
        {
            if (_SafeStr_5230 != null)
            {
                _SafeStr_5230.dispose();
                _SafeStr_5230 = null;
            };
        }

        private function onGenderSelectionWindowClose(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            if (_arg_1.type != "WME_CLICK")
            {
                return;
            };
            hideGenderSelectionInterface();
        }

        private function onGenderSelectionMouseEvent(_arg_1:WindowMouseEvent):void
        {
            var _local_2:_SafeStr_3109 = (_arg_1.target as _SafeStr_3109);
            var _local_3:String = _local_2.name;
            switch (_local_3)
            {
                case "Boy":
                    requestEditor("M");
                    hideGenderSelectionInterface();
                    return;
                case "Girl":
                    requestEditor("F");
                    hideGenderSelectionInterface();
                    return;
                case "close":
                case "close_btn":
                    hideGenderSelectionInterface();
                    return;
            };
        }

        private function requestEditor(_arg_1:String):void
        {
            var _local_2:RoomWidgetClothingChangeMessage = new RoomWidgetClothingChangeMessage("RWCCM_REQUEST_EDITOR", _arg_1, _SafeStr_4157, _SafeStr_4750, _SafeStr_3693);
            messageListener.processWidgetMessage(_local_2);
        }


    }
}//package com.sulake.habbo.ui.widget.furniture.clothingchange

// _SafeStr_1695 = "_-sN" (String#340, DoABC#4)
// _SafeStr_18 = "_-61x" (String#484, DoABC#4)
// _SafeStr_21 = "_-61a" (String#265, DoABC#4)
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3693 = "_-KI" (String#730, DoABC#4)
// _SafeStr_4157 = "_-G8" (String#491, DoABC#4)
// _SafeStr_4750 = "_-E1d" (String#2700, DoABC#4)
// _SafeStr_5230 = "_-ze" (String#5597, DoABC#4)
// _SafeStr_9014 = "_-12s" (String#34075, DoABC#4)
// _SafeStr_9015 = "_-XV" (String#31930, DoABC#4)


