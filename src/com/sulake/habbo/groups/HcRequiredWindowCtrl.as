// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.groups.HcRequiredWindowCtrl

package com.sulake.habbo.groups
{
    import com.sulake.core.runtime._SafeStr_13;
    import com.sulake.core.window.components._SafeStr_3263;
    import com.sulake.core.window.events._SafeStr_3116;
    import com.sulake.core.window._SafeStr_3109;

    public class HcRequiredWindowCtrl implements _SafeStr_13 
    {

        private var _SafeStr_4144:HabboGroupsManager;
        private var _window:_SafeStr_3263;

        public function HcRequiredWindowCtrl(_arg_1:HabboGroupsManager)
        {
            _SafeStr_4144 = _arg_1;
        }

        public function dispose():void
        {
            _SafeStr_4144 = null;
            if (_window)
            {
                _window.dispose();
                _window = null;
            };
        }

        public function get disposed():Boolean
        {
            return (_SafeStr_4144 == null);
        }

        public function show(_arg_1:Boolean):void
        {
            prepareWindow();
            _window.findChildByName("info_txt").caption = ((_arg_1) ? "${group.hcrequired.info.manage}" : "${group.hcrequired.info.join}");
            _window.visible = true;
            _window.activate();
        }

        private function prepareWindow():void
        {
            if (_window != null)
            {
                return;
            };
            _window = _SafeStr_3263(_SafeStr_4144.getXmlWindow("club_required"));
            _window.findChildByTag("close").procedure = onClose;
            _window.findChildByName("cancel_link_region").procedure = onClose;
            _window.findChildByName("join_button").procedure = onOpenCatalog;
            _window.findChildByName("more_info_link_region").procedure = onOpenCatalog;
            _window.center();
        }

        private function onClose(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            if (_arg_1.type == "WME_CLICK")
            {
                close();
            };
        }

        private function onOpenCatalog(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            if (_arg_1.type == "WME_CLICK")
            {
                _SafeStr_4144.openVipPurchase("HcRequiredWindowCtrl");
                close();
            };
        }

        public function close():void
        {
            if (_window != null)
            {
                _window.visible = false;
            };
        }


    }
}//package com.sulake.habbo.groups

// _SafeStr_13 = "_-P1N" (String#326, DoABC#4)
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_3263 = "_-21c" (String#378, DoABC#4)
// _SafeStr_4144 = "_-n1T" (String#228, DoABC#4)


