// by nota

//com.sulake.habbo.nux.NuxOfferOldUserView

package com.sulake.habbo.nux
{
    import com.sulake.core.window.components._SafeStr_3263;
    import com.sulake.core.assets.XmlAsset;
    import com.sulake.core.window._SafeStr_3109;
    import com.sulake.core.window.events.WindowMouseEvent;

    public class NuxOfferOldUserView 
    {

        private var _frame:_SafeStr_3263;
        private var _SafeStr_4147:HabboNuxDialogs;

        public function NuxOfferOldUserView(_arg_1:HabboNuxDialogs)
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
            var _local_2:XmlAsset = (_SafeStr_4147.assets.getAssetByName("nux_offer_old_user_xml") as XmlAsset);
            _frame = (_SafeStr_4147.windowManager.buildFromXML((_local_2.content as XML)) as _SafeStr_3263);
            if (_frame == null)
            {
                throw (new Error("Failed to construct window from XML!"));
            };
            _frame.center();
            var _local_1:_SafeStr_3109 = _frame.findChildByTag("close");
            if (_local_1)
            {
                _local_1.visible = false;
            };
            _local_1 = _frame.findChildByName("btnSkip");
            _local_1.addEventListener("WME_CLICK", onReject);
            _local_1 = _frame.findChildByName("btnGo");
            _local_1.addEventListener("WME_CLICK", onVerify);
        }

        private function onClose(_arg_1:WindowMouseEvent):void
        {
            hide();
        }

        private function onVerify(_arg_1:WindowMouseEvent):void
        {
            _SafeStr_4147.onVerify();
            hide();
        }

        private function onReject(_arg_1:WindowMouseEvent):void
        {
            _SafeStr_4147.onReject();
        }


    }
}//package com.sulake.habbo.nux

// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3263 = "_-21c" (String#378, DoABC#4)
// _SafeStr_4147 = "_-Q1a" (String#196, DoABC#4)


