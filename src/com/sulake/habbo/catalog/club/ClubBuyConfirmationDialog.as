// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.catalog.club.ClubBuyConfirmationDialog

package com.sulake.habbo.catalog.club
{
    import com.sulake.core.window.components._SafeStr_3263;
    import com.sulake.habbo.localization._SafeStr_18;
    import com.sulake.habbo.catalog.purse._SafeStr_3142;
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.core.window._SafeStr_3109;
    import com.sulake.core.window.components._SafeStr_3158;
    import com.sulake.core.window.events._SafeStr_3116;

    public class ClubBuyConfirmationDialog 
    {

        private var _offer:ClubBuyOfferData;
        private var _SafeStr_4360:ClubBuyController;
        private var _SafeStr_3882:_SafeStr_3263;
        private var _SafeStr_4786:int;

        public function ClubBuyConfirmationDialog(_arg_1:ClubBuyController, _arg_2:ClubBuyOfferData, _arg_3:int)
        {
            _offer = _arg_2;
            _SafeStr_4360 = _arg_1;
            _SafeStr_4786 = _arg_3;
            showConfirmation();
        }

        public function dispose():void
        {
            _SafeStr_4360 = null;
            _offer = null;
            if (_SafeStr_3882)
            {
                _SafeStr_3882.dispose();
                _SafeStr_3882 = null;
            };
        }

        public function showConfirmation():void
        {
            if (((!(_offer)) || (!(_SafeStr_4360))))
            {
                return;
            };
            _SafeStr_3882 = (_SafeStr_4360.catalog.utils.createWindow("club_buy_confirmation") as _SafeStr_3263);
            if (!_SafeStr_3882)
            {
                return;
            };
            _SafeStr_3882.procedure = windowEventHandler;
            _SafeStr_3882.center();
            if (_SafeStr_4360.catalog.getBoolean("disclaimer.credit_spending.enabled"))
            {
                setDisclaimerAccepted(false);
            }
            else
            {
                _SafeStr_3882.findChildByName("disclaimer").dispose();
                setDisclaimerAccepted(true);
            };
            var _local_1:_SafeStr_18 = _SafeStr_4360.localization;
            var _local_4:_SafeStr_3142 = _SafeStr_4360.getPurse();
            var _local_5:String = (((_local_4.hasClubLeft) && (_local_4.isVIP)) ? "extension." : "subscription.");
            var _local_3:String = ((_offer.months == 0) ? "days" : "months");
            var _local_2:String = (("catalog.vip.buy.confirm." + _local_5) + _local_3);
            _local_1.registerParameter(_local_2, ("num_" + _local_3), ((_offer.months == 0) ? _offer.extraDays : _offer.months));
            _SafeStr_3882.findChildByName("subscription_name").caption = _local_1.getLocalization(_local_2);
            _local_1.registerParameter("catalog.vip.buy.confirm.end_date", "day", _offer.day);
            _local_1.registerParameter("catalog.vip.buy.confirm.end_date", "month", _offer.month);
            _local_1.registerParameter("catalog.vip.buy.confirm.end_date", "year", _offer.year);
            _SafeStr_4360.catalog.utils.showPriceInContainer((_SafeStr_3882.findChildByName("purchase_cost_box") as _SafeStr_3133), _offer);
        }

        private function setDisclaimerAccepted(_arg_1:Boolean):void
        {
            if (_SafeStr_3882 == null)
            {
                return;
            };
            var _local_2:_SafeStr_3109 = _SafeStr_3882.findChildByName("select_button");
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

        private function windowEventHandler(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            if (((((!(_arg_1)) || (!(_arg_2))) || (!(_SafeStr_4360))) || (!(_offer))))
            {
                return;
            };
            if (((!(_arg_1.type == "WME_CLICK")) && (!(_arg_1.type == "WME_DOUBLE_CLICK"))))
            {
                return;
            };
            switch (_arg_2.name)
            {
                case "spending_disclaimer":
                    setDisclaimerAccepted(_SafeStr_3158(_arg_2).isSelected);
                    return;
                case "select_button":
                    _SafeStr_4360.catalog.doNotCloseAfterVipPurchase();
                    _SafeStr_4360.confirmSelection(_offer, _SafeStr_4786);
                    return;
                case "header_button_close":
                case "cancel_button":
                    _SafeStr_4360.catalog.forgetPageDuringVipPurchase();
                    _SafeStr_4360.closeConfirmation();
                    return;
            };
        }


    }
}//package com.sulake.habbo.catalog.club

// _SafeStr_18 = "_-61x" (String#484, DoABC#4)
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3142 = "_-z5" (String#4391, DoABC#4)
// _SafeStr_3158 = "_-RF" (String#812, DoABC#4)
// _SafeStr_3263 = "_-21c" (String#378, DoABC#4)
// _SafeStr_3882 = "_-D10" (String#53, DoABC#4)
// _SafeStr_4360 = "_-58" (String#91, DoABC#4)
// _SafeStr_4786 = "_-l1k" (String#2541, DoABC#4)


