// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.catalog.targetedoffers.TargetedOfferPurchaseConfirmationView

package com.sulake.habbo.catalog.targetedoffers
{
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.habbo.catalog.HabboCatalog;
    import com.sulake.core.window.components.ITextWindow;
    import com.sulake.habbo.catalog.targetedoffers.data.TargetedOffer;
    import com.sulake.core.window._SafeStr_3109;
    import com.sulake.core.window.components._SafeStr_3158;
    import com.sulake.core.window.events._SafeStr_3116;

    public class TargetedOfferPurchaseConfirmationView extends OfferView 
    {

        private var _SafeStr_4892:int;

        public function TargetedOfferPurchaseConfirmationView(_arg_1:OfferController, _arg_2:TargetedOffer, _arg_3:int)
        {
            super(_arg_1, _arg_2);
            _SafeStr_4892 = _arg_3;
            _window = _SafeStr_3133(_SafeStr_4360.catalog.windowManager.buildFromXML(XML(_SafeStr_4360.catalog.assets.getAssetByName("targeted_offer_purchase_confirmation_xml").content)));
            var _local_4:HabboCatalog = (_SafeStr_4360.catalog as HabboCatalog);
            if (_local_4.getBoolean("disclaimer.credit_spending.enabled"))
            {
                setDisclaimerAccepted(false);
            }
            else
            {
                _window.findChildByName("disclaimer").dispose();
                setDisclaimerAccepted(true);
            };
            ITextWindow(_window.findChildByName("product_name")).text = getLocalization(_arg_2.title);
            var _local_5:_SafeStr_3133 = (_window.findChildByName("purchase_cost_box") as _SafeStr_3133);
            _local_4.utils.showPriceInContainer(_local_5, _arg_2, _arg_3);
            var _local_6:ITextWindow = (_window.findChildByName("quantity") as ITextWindow);
            if (_local_6 != null)
            {
                if (((_arg_1.catalog.multiplePurchaseEnabled) && (_SafeStr_4892 > 1)))
                {
                    _local_6.text = ("X " + _SafeStr_4892);
                };
            };
            _window.procedure = onInput;
            _window.center();
        }

        private function setDisclaimerAccepted(_arg_1:Boolean):void
        {
            if (_window == null)
            {
                return;
            };
            var _local_2:_SafeStr_3109 = _window.findChildByName("select_button");
            if (_local_2 == null)
            {
                return;
            };
            if (_arg_1)
            {
                _local_2.enable();
            }
            else
            {
                _local_2.disable();
            };
        }

        private function onInput(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            if (!_SafeStr_4360)
            {
                return;
            };
            if (_arg_1.type == "WME_DOWN")
            {
                switch (_arg_2.name)
                {
                    case "spending_disclaimer":
                        setDisclaimerAccepted(_SafeStr_3158(_arg_2).isSelected);
                        return;
                    case "header_button_close":
                    case "cancel_button":
                        _SafeStr_4360.maximizeOffer(_offer);
                        return;
                    case "buy_button":
                        _SafeStr_4360.purchaseTargetedOffer(_offer, _SafeStr_4892);
                        return;
                };
            };
        }


    }
}//package com.sulake.habbo.catalog.targetedoffers

// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3158 = "_-RF" (String#812, DoABC#4)
// _SafeStr_4360 = "_-58" (String#91, DoABC#4)
// _SafeStr_4892 = "_-P1m" (String#1893, DoABC#4)


