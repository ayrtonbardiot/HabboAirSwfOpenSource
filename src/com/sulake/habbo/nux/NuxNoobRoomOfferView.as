// by nota

//com.sulake.habbo.nux.NuxNoobRoomOfferView

package com.sulake.habbo.nux
{
    import com.sulake.core.window.components._SafeStr_3263;
    import com.sulake.core.assets.XmlAsset;
    import com.sulake.core.window._SafeStr_3109;
    import com.sulake.core.window.events.WindowMouseEvent;

    public class NuxNoobRoomOfferView 
    {

        private var _frame:_SafeStr_3263;
        private var _SafeStr_4147:HabboNuxDialogs;

        public function NuxNoobRoomOfferView(_arg_1:HabboNuxDialogs)
        {
            _SafeStr_4147 = _arg_1;
            show();
        }

        public function dispose():void
        {
            if (_frame)
            {
                _frame.dispose();
                _frame = null;
            };
            _SafeStr_4147 = null;
        }

        private function hide():void
        {
            if (_SafeStr_4147)
            {
                _SafeStr_4147.destroyNuxOfferView();
            };
        }

        private function show():void
        {
            if (_frame != null)
            {
                return;
            };
            var _local_3:XmlAsset = (_SafeStr_4147.assets.getAssetByName("nux_noob_room_offer_xml") as XmlAsset);
            _frame = (_SafeStr_4147.windowManager.buildFromXML((_local_3.content as XML)) as _SafeStr_3263);
            if (_frame == null)
            {
                throw (new Error("Failed to construct window from XML!"));
            };
            var _local_4:* = 20;
            _frame.y = _local_4;
            _frame.x = _local_4;
            var _local_1:_SafeStr_3109 = _frame.findChildByName("btnGo");
            if (_local_1)
            {
                _local_1.addEventListener("WME_CLICK", onGo);
            };
            var _local_2:_SafeStr_3109 = _frame.findChildByTag("close");
            if (_local_2)
            {
                _local_2.addEventListener("WME_CLICK", onClose);
            };
        }

        private function onGo(_arg_1:WindowMouseEvent):void
        {
            _SafeStr_4147.context.createLinkEvent("navigator/goto/predefined_noob_lobby");
        }

        private function onClose(_arg_1:WindowMouseEvent):void
        {
            _SafeStr_4147.destroyNoobRoomOfferView();
        }


    }
}//package com.sulake.habbo.nux

// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3263 = "_-21c" (String#378, DoABC#4)
// _SafeStr_4147 = "_-Q1a" (String#196, DoABC#4)


