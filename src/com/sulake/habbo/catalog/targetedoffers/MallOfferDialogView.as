// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.catalog.targetedoffers.MallOfferDialogView

package com.sulake.habbo.catalog.targetedoffers
{
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.habbo.catalog.targetedoffers.data.HabboMallOffer;
    import com.sulake.core.window.components._SafeStr_3263;
    import com.sulake.core.window.components.ITextWindow;
    import com.sulake.core.runtime._SafeStr_19;
    import com.sulake.core.window.components.IStaticBitmapWrapperWindow;
    import com.sulake.core.window.events._SafeStr_3116;
    import com.sulake.core.window._SafeStr_3109;

    public class MallOfferDialogView 
    {

        private var _SafeStr_4360:OfferController;
        private var _window:_SafeStr_3133;
        private var _offer:HabboMallOffer;

        public function MallOfferDialogView(_arg_1:OfferController, _arg_2:HabboMallOffer)
        {
            var _local_3:* = null;
            super();
            _SafeStr_4360 = _arg_1;
            _offer = _arg_2;
            _window = _SafeStr_3133(_SafeStr_4360.catalog.windowManager.buildFromXML(XML(_SafeStr_4360.catalog.assets.getAssetByName("targeted_offer_habbomall_xml").content)));
            _SafeStr_3263(_window).title.text = getLocalization(_offer.title);
            ITextWindow(_window.findChildByName("txt_title")).text = getLocalization(_offer.title);
            if (((_arg_2.imageUrl) && (_arg_2.imageUrl.length > 0)))
            {
                _local_3 = (_SafeStr_4360.catalog as _SafeStr_19).getProperty("image.library.url");
                IStaticBitmapWrapperWindow(_window.findChildByName("bmp_illustration")).assetUri = (_local_3 + _arg_2.imageUrl);
            };
            _window.procedure = onInput;
            _window.center();
        }

        public function dispose():void
        {
            if (_window != null)
            {
                _window.dispose();
                _window = null;
            };
        }

        private function onInput(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            if (((!(_SafeStr_4360)) || (!(_offer))))
            {
                return;
            };
            if (_arg_1.type == "WME_DOWN")
            {
                switch (_arg_2.name)
                {
                    case "header_button_close":
                        _SafeStr_4360.onHabboMallOfferClosed(_offer);
                        return;
                    case "btn_buy":
                        _SafeStr_4360.onHabboMallOfferOpened(_offer);
                        return;
                };
            };
        }

        private function getLocalization(_arg_1:String, _arg_2:String=null):String
        {
            return (_SafeStr_4360.catalog.localization.getLocalization(_arg_1, ((_arg_2) || (_arg_1))));
        }


    }
}//package com.sulake.habbo.catalog.targetedoffers

// _SafeStr_19 = "_-01r" (String#1323, DoABC#4)
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3263 = "_-21c" (String#378, DoABC#4)
// _SafeStr_4360 = "_-58" (String#91, DoABC#4)


