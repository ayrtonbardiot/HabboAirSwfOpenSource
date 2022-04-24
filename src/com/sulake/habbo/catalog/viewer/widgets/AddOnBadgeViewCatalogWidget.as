// by nota

//com.sulake.habbo.catalog.viewer.widgets.AddOnBadgeViewCatalogWidget

package com.sulake.habbo.catalog.viewer.widgets
{
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.core.window.components._SafeStr_3199;
    import com.sulake.habbo.window.widgets._SafeStr_3349;
    import com.sulake.habbo.catalog.viewer.widgets.events.SelectProductEvent;

    public class AddOnBadgeViewCatalogWidget extends CatalogWidget implements _SafeStr_3303 
    {

        public function AddOnBadgeViewCatalogWidget(_arg_1:_SafeStr_3133)
        {
            super(_arg_1);
        }

        override public function dispose():void
        {
            if (!disposed)
            {
                events.removeEventListener("SELECT_PRODUCT", onSelectProduct);
                super.dispose();
            };
        }

        override public function init():Boolean
        {
            if (!super.init())
            {
                return (false);
            };
            attachWidgetView("addOnBadgeViewWidget");
            events.addEventListener("SELECT_PRODUCT", onSelectProduct);
            return (true);
        }

        private function onSelectProduct(_arg_1:SelectProductEvent):void
        {
            var _local_2:* = null;
            if (((!(disposed)) && (_arg_1.offer.badgeCode)))
            {
                _local_2 = (_SafeStr_3199(_window.findChildByName("badge")).widget as _SafeStr_3349);
                if (_local_2 != null)
                {
                    _local_2.badgeId = _arg_1.offer.badgeCode;
                };
            };
        }


    }
}//package com.sulake.habbo.catalog.viewer.widgets

// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3199 = "_-Z1u" (String#359, DoABC#4)
// _SafeStr_3303 = "_-g1Z" (String#1682, DoABC#4)
// _SafeStr_3349 = "_-c1x" (String#1353, DoABC#4)


