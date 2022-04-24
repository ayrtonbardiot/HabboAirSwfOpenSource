// by nota

//com.sulake.habbo.catalog.viewer.widgets.SpecialInfoWidget

package com.sulake.habbo.catalog.viewer.widgets
{
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.habbo.catalog.viewer.widgets.events.SelectProductEvent;

    public class SpecialInfoWidget extends CatalogWidget implements _SafeStr_3303 
    {

        public function SpecialInfoWidget(_arg_1:_SafeStr_3133)
        {
            super(_arg_1);
        }

        override public function init():Boolean
        {
            if (!super.init())
            {
                return (false);
            };
            attachWidgetView("specialInfoWidget");
            _window.findChildByName("ctlg_special_txt").caption = "";
            events.addEventListener("SELECT_PRODUCT", onPreviewProduct);
            return (true);
        }

        private function onPreviewProduct(_arg_1:SelectProductEvent):void
        {
            if (_arg_1 == null)
            {
                return;
            };
            _window.visible = false;
        }


    }
}//package com.sulake.habbo.catalog.viewer.widgets

// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3303 = "_-g1Z" (String#1682, DoABC#4)


