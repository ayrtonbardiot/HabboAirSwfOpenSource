// by nota

//com.sulake.habbo.catalog.viewer.widgets.BuilderSubscriptionCatalogWidget

package com.sulake.habbo.catalog.viewer.widgets
{
    import com.sulake.core.runtime._SafeStr_13;
    import com.sulake.habbo.catalog.HabboCatalog;
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.core.window._SafeStr_3109;
    import com.sulake.habbo.catalog.viewer.widgets.events.CatalogWidgetBuilderSubscriptionUpdatedEvent;
    import com.sulake.habbo.utils.HabboWebTools;
    import com.sulake.core.window.events._SafeStr_3116;

    public class BuilderSubscriptionCatalogWidget extends CatalogWidget implements _SafeStr_3303, _SafeStr_13 
    {

        private var _catalog:HabboCatalog;
        private var _SafeStr_6901:String;

        public function BuilderSubscriptionCatalogWidget(_arg_1:_SafeStr_3133, _arg_2:HabboCatalog)
        {
            super(_arg_1);
            _catalog = _arg_2;
        }

        override public function init():Boolean
        {
            if (!super.init())
            {
                return (false);
            };
            _SafeStr_6901 = _catalog.getProperty("builders_club.buy_membership_page");
            updateSubscriptionInfo();
            _window.procedure = windowProcedure;
            events.addEventListener("CWE_BUILDER_SUBSCRIPTION_UPDATED", onBuilderSubscriptionUpdated);
            return (true);
        }

        private function updateSubscriptionInfo():void
        {
            var _local_4:Number = _catalog.builderSecondsLeft;
            var _local_2:_SafeStr_3109 = _window.findChildByName("subscribe_button");
            var _local_3:_SafeStr_3109 = _window.findChildByName("subscribe_button_sms");
            var _local_1:_SafeStr_3109 = _window.findChildByName("subscribe_button_big");
            var _local_5:_SafeStr_3109 = _window.findChildByName("try_button");
            if ((((!(!(_local_5 == null))) || (!(!(_local_2 == null)))) || (!(!(_local_1 == null)))))
            {
                return;
            };
            if (((_local_4 > 0) || (_catalog.getCatalogNavigator("BUILDERS_CLUB").getOptionalNodeByName(_catalog.getProperty("builders_club.try_page")) == null)))
            {
                _local_1.visible = true;
                _local_2.visible = false;
                _local_5.visible = false;
                _local_3.visible = false;
            }
            else
            {
                _local_1.visible = false;
                _local_2.visible = false;
                _local_5.visible = true;
                _local_3.visible = false;
            };
            if (((!(_SafeStr_6901 == null)) && (!(_SafeStr_6901 == ""))))
            {
                _local_3.visible = true;
                if (!_local_5.visible)
                {
                    _local_3.x = _local_5.x;
                    _local_3.y = _local_5.y;
                };
                if (_local_1.visible)
                {
                    _local_1.visible = false;
                    _local_2.visible = false;
                };
            };
        }

        private function onBuilderSubscriptionUpdated(_arg_1:CatalogWidgetBuilderSubscriptionUpdatedEvent):void
        {
            updateSubscriptionInfo();
        }

        private function windowProcedure(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            if (_arg_1.type != "WME_CLICK")
            {
                return;
            };
            switch (_arg_2.name)
            {
                case "subscribe_button_big":
                case "subscribe_button":
                    HabboWebTools.openWebPageAndMinimizeClient(_catalog.getProperty("web.shop.subscription.relativeUrl"));
                    return;
                case "subscribe_button_sms":
                    HabboWebTools.openWebPageAndMinimizeClient(_SafeStr_6901);
                    return;
                case "try_button":
                    _catalog.openCatalogPage(_catalog.getProperty("builders_club.try_page"), "BUILDERS_CLUB");
                    return;
            };
        }


    }
}//package com.sulake.habbo.catalog.viewer.widgets

// _SafeStr_13 = "_-P1N" (String#326, DoABC#4)
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3303 = "_-g1Z" (String#1682, DoABC#4)
// _SafeStr_6901 = "_-218" (String#12539, DoABC#4)


