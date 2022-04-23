// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.toolbar.offers.OfferExtension

package com.sulake.habbo.toolbar.offers
{
    import com.sulake.habbo.catalog.offers.IOfferExtension;
    import com.sulake.core.runtime._SafeStr_13;
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.habbo.toolbar.HabboToolbar;
    import com.sulake.habbo.catalog.offers.IOfferCenter;
    import com.sulake.core.window.components.IItemListWindow;
    import com.sulake.habbo.window._SafeStr_1695;
    import com.sulake.core.assets._SafeStr_21;
    import com.sulake.habbo.catalog.IHabboCatalog;
    import com.sulake.core.window.events._SafeStr_3116;
    import com.sulake.core.window._SafeStr_3109;

    public class OfferExtension implements IOfferExtension, _SafeStr_13 
    {

        private var _disposed:Boolean;
        private var _window:_SafeStr_3133;
        private var _toolbar:HabboToolbar;
        private var _offerCenter:IOfferCenter;
        private var _SafeStr_4162:IItemListWindow;

        public function OfferExtension(_arg_1:HabboToolbar, _arg_2:_SafeStr_1695, _arg_3:_SafeStr_21, _arg_4:IHabboCatalog)
        {
            _toolbar = _arg_1;
            _window = (_arg_2.buildFromXML((_arg_3.getAssetByName("offer_extension_xml").content as XML)) as _SafeStr_3133);
            _window.procedure = windowProcedure;
            _window.visible = false;
            _SafeStr_4162 = (_window.findChildByName("list") as IItemListWindow);
            _offerCenter = _arg_4.getOfferCenter(this);
            _arg_1.extensionView.attachExtension("video_offers", window, 8);
            refresh();
        }

        private function windowProcedure(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            if (_arg_1.type != "WME_CLICK")
            {
                return;
            };
            switch (_arg_2.name)
            {
                case "start_video":
                    _offerCenter.showVideo();
                    return;
                case "check_rewards":
                    _offerCenter.showRewards();
                    return;
            };
        }

        public function dispose():void
        {
            if (_disposed)
            {
                return;
            };
            _SafeStr_4162 = null;
            if (_window != null)
            {
                _window.dispose();
                _window = null;
            };
            _toolbar = null;
            _disposed = true;
        }

        public function get disposed():Boolean
        {
            return (_disposed);
        }

        public function get window():_SafeStr_3133
        {
            return (_window);
        }

        public function indicateRewards():void
        {
            if (_window != null)
            {
                _window.visible = true;
                _window.findChildByName("check_rewards").visible = true;
                refresh();
            };
        }

        public function indicateVideoAvailable(_arg_1:Boolean):void
        {
            var _local_2:* = null;
            if (_window != null)
            {
                _window.visible = ((_window.visible) || (_arg_1));
                _local_2 = _window.findChildByName("start_video");
                _local_2.visible = _arg_1;
                if (_offerCenter.showingVideo)
                {
                    _local_2.disable();
                    _local_2.color = 0x999999;
                }
                else
                {
                    _local_2.enable();
                    _local_2.color = 12932417;
                };
                refresh();
            };
        }

        private function refresh():void
        {
            _SafeStr_4162.arrangeListItems();
            _window.visible = ((_SafeStr_4162.getListItemAt(0).visible) || (_SafeStr_4162.getListItemAt(1).visible));
            _toolbar.extensionView.refreshItemWindow();
        }


    }
}//package com.sulake.habbo.toolbar.offers

// _SafeStr_13 = "_-P1N" (String#326, DoABC#4)
// _SafeStr_1695 = "_-sN" (String#340, DoABC#4)
// _SafeStr_21 = "_-61a" (String#265, DoABC#4)
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_4162 = "_-CL" (String#282, DoABC#4)


