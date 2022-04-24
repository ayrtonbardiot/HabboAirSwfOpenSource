// by nota

//com.sulake.habbo.toolbar.extensions.CitizenshipVipQuestsPromoExtension

package com.sulake.habbo.toolbar.extensions
{
    import com.sulake.habbo.window._SafeStr_1695;
    import com.sulake.core.assets._SafeStr_21;
    import flash.events.IEventDispatcher;
    import com.sulake.core.localization._SafeStr_17;
    import com.sulake.core.communication.connection.IConnection;
    import com.sulake.habbo.toolbar.IExtensionView;
    import com.sulake.core.window.components._SafeStr_3195;
    import com.sulake.core.communication.messages.IMessageEvent;
    import _-111._SafeStr_250;
    import com.sulake.habbo.toolbar.HabboToolbar;
    import com.sulake.core.assets.IAsset;
    import com.sulake.core.window.components._SafeStr_3122;
    import com.sulake.core.window.components.IRegionWindow;
    import _-61d._SafeStr_705;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.components.IItemListWindow;
    import com.sulake.core.window.components.IStaticBitmapWrapperWindow;

    public class CitizenshipVipQuestsPromoExtension 
    {

        private var _windowManager:_SafeStr_1695;
        private var _assets:_SafeStr_21;
        private var _SafeStr_3983:IEventDispatcher;
        private var _localization:_SafeStr_17;
        private var _connection:IConnection;
        private var _SafeStr_3915:IExtensionView;
        private var _SafeStr_3882:_SafeStr_3195;
        private var _disposed:Boolean = false;
        private var _expanded:Boolean = true;
        private var _SafeStr_4155:int = 216;
        private var _vipQuestsCampaignName:String;
        private var _SafeStr_5222:IMessageEvent = null;

        public function CitizenshipVipQuestsPromoExtension(_arg_1:HabboToolbar, _arg_2:_SafeStr_1695, _arg_3:_SafeStr_21, _arg_4:IEventDispatcher, _arg_5:_SafeStr_17, _arg_6:IConnection)
        {
            _windowManager = _arg_2;
            _assets = _arg_3;
            _SafeStr_3983 = _arg_4;
            _localization = _arg_5;
            _connection = _arg_6;
            _SafeStr_3915 = _arg_1.extensionView;
            _SafeStr_5222 = new _SafeStr_250(onCitizenshipQuestPromoEnabled);
            _connection.addMessageEvent(_SafeStr_5222);
            _vipQuestsCampaignName = _arg_1.getProperty("citizenship.vip.tutorial.quest.campaign.name");
        }

        public function dispose():void
        {
            if (_disposed)
            {
                return;
            };
            if (((_connection) && (_SafeStr_5222)))
            {
                _connection.removeMessageEvent(_SafeStr_5222);
                _SafeStr_5222 = null;
            };
            destroyWindow();
            _localization = null;
            _assets = null;
            _SafeStr_3983 = null;
            _windowManager = null;
            _connection = null;
            _SafeStr_3915 = null;
            _disposed = true;
        }

        private function createWindow():_SafeStr_3195
        {
            var _local_1:_SafeStr_3195;
            var _local_2:IAsset = _assets.getAssetByName("vip_quests_promo_xml");
            if (_local_2)
            {
                _local_1 = (_windowManager.buildFromXML((_local_2.content as XML), 1) as _SafeStr_3195);
                if (_local_1)
                {
                    (_SafeStr_3122(_local_1.findChildByName("quests_button").addEventListener("WME_CLICK", onButtonClicked)));
                    IRegionWindow(_local_1.findChildByName("minimize_region")).addEventListener("WME_CLICK", onMinMax);
                    IRegionWindow(_local_1.findChildByName("maximize_region")).addEventListener("WME_CLICK", onMinMax);
                    _SafeStr_4155 = _local_1.height;
                };
            };
            return (_local_1);
        }

        private function destroyWindow():void
        {
            if (_SafeStr_3915)
            {
                _SafeStr_3915.detachExtension("vip_quests");
            };
            if (_SafeStr_3882)
            {
                _SafeStr_3882.dispose();
                _SafeStr_3882 = null;
            };
        }

        private function onButtonClicked(_arg_1:WindowMouseEvent):void
        {
            if (_connection)
            {
                _connection.send(new _SafeStr_705(_vipQuestsCampaignName));
            };
            destroyWindow();
        }

        private function onMinMax(_arg_1:WindowMouseEvent):void
        {
            _expanded = (!(_expanded));
            assignState();
        }

        private function assignState():void
        {
            IItemListWindow(_SafeStr_3882.findChildByName("content_itemlist")).visible = _expanded;
            IStaticBitmapWrapperWindow(_SafeStr_3882.findChildByName("promo_img")).visible = _expanded;
            _SafeStr_3882.height = ((_expanded) ? _SafeStr_4155 : 33);
        }

        private function onCitizenshipQuestPromoEnabled(_arg_1:IMessageEvent):void
        {
            if (_SafeStr_3882 == null)
            {
                _SafeStr_3882 = createWindow();
            };
            assignState();
            _SafeStr_3915.detachExtension("club_promo");
            _SafeStr_3915.attachExtension("vip_quests", _SafeStr_3882, 10);
        }


    }
}//package com.sulake.habbo.toolbar.extensions

// _SafeStr_1695 = "_-sN" (String#340, DoABC#4)
// _SafeStr_17 = "_-94" (String#5077, DoABC#4)
// _SafeStr_21 = "_-61a" (String#265, DoABC#4)
// _SafeStr_250 = "_-W16" (String#31549, DoABC#4)
// _SafeStr_3122 = "_-i1L" (String#666, DoABC#4)
// _SafeStr_3195 = "_-b1g" (String#876, DoABC#4)
// _SafeStr_3882 = "_-D10" (String#53, DoABC#4)
// _SafeStr_3915 = "_-c1K" (String#3110, DoABC#4)
// _SafeStr_3983 = "_-OX" (String#641, DoABC#4)
// _SafeStr_4155 = "_-C1K" (String#6965, DoABC#4)
// _SafeStr_5222 = "_-Z3" (String#10156, DoABC#4)
// _SafeStr_705 = "_-eG" (String#18991, DoABC#4)


