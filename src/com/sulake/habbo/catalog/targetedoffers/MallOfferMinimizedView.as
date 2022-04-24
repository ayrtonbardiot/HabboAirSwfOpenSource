// by nota

//com.sulake.habbo.catalog.targetedoffers.MallOfferMinimizedView

package com.sulake.habbo.catalog.targetedoffers
{
    import com.sulake.habbo.catalog.targetedoffers.data.HabboMallOffer;
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.core.window.components.ITextWindow;
    import com.sulake.core.runtime._SafeStr_19;
    import com.sulake.core.window.components.IStaticBitmapWrapperWindow;
    import com.sulake.core.window.events._SafeStr_3116;
    import com.sulake.core.window._SafeStr_3109;

    public class MallOfferMinimizedView extends OfferView 
    {

        private static const IMAGE_DEFAULT_URL:String = "targetedoffers/offer_default_icon.png";

        private var _SafeStr_6235:HabboMallOffer;

        public function MallOfferMinimizedView(_arg_1:OfferController, _arg_2:HabboMallOffer)
        {
            super(_arg_1, null);
            _SafeStr_6235 = _arg_2;
            _window = _SafeStr_3133(_SafeStr_4360.catalog.windowManager.buildFromXML(XML(_SafeStr_4360.catalog.assets.getAssetByName("targeted_offer_minimized_xml").content)));
            var _local_4:ITextWindow = ITextWindow(_window.findChildByName("txt_title"));
            if (_local_4)
            {
                _local_4.text = getLocalization(_arg_2.title);
            };
            var _local_3:String = (_SafeStr_4360.catalog as _SafeStr_19).getProperty("image.library.url");
            IStaticBitmapWrapperWindow(_window.findChildByName("bmp_icon")).assetUri = (_local_3 + "targetedoffers/offer_default_icon.png");
            _window.procedure = onInput;
            _SafeStr_4360.attachExtension(_window);
        }

        private function onInput(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            if (!_SafeStr_4360)
            {
                return;
            };
            if (_arg_1.type == "WME_DOWN")
            {
                _SafeStr_4360.maximizeMallOffer(_SafeStr_6235);
                _arg_2.name;
            };
        }

        public function get window():_SafeStr_3109
        {
            return (_window);
        }


    }
}//package com.sulake.habbo.catalog.targetedoffers

// _SafeStr_19 = "_-01r" (String#1323, DoABC#4)
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_4360 = "_-58" (String#91, DoABC#4)
// _SafeStr_6235 = "_-gS" (String#19131, DoABC#4)


