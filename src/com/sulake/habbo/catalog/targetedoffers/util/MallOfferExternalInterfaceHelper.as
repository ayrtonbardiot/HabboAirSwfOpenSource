﻿// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.catalog.targetedoffers.util.MallOfferExternalInterfaceHelper

package com.sulake.habbo.catalog.targetedoffers.util
{
    import com.sulake.habbo.catalog.targetedoffers.OfferController;
    import flash.external.ExternalInterface;
    import com.sulake.habbo.catalog.targetedoffers.data.HabboMallOffer;

    public class MallOfferExternalInterfaceHelper 
    {

        private static const GET_HABBO_SHOP_OFFER_FUNCTION:String = "TargetedWebOffer.checkOffer";
        private static const GET_HABBO_SHOP_OFFER_FAILED_CALLBACK:String = "targetedWebOfferCheckFailed";
        private static const GET_HABBO_SHOP_OFFER_RESULT_CALLBACK:String = "targetedWebOfferCheckResponse";

        private var _SafeStr_4360:OfferController;

        public function MallOfferExternalInterfaceHelper(_arg_1:OfferController)
        {
            _SafeStr_4360 = _arg_1;
            if (ExternalInterface.available)
            {
                ExternalInterface.addCallback("targetedWebOfferCheckResponse", onShopOfferResult);
                ExternalInterface.addCallback("targetedWebOfferCheckFailed", onShopOfferFailed);
                ExternalInterface.call("TargetedWebOffer.checkOffer");
            }
            else
            {
                return;
            };
        }

        public function dispose():void
        {
            if (ExternalInterface.available)
            {
                ExternalInterface.addCallback("targetedWebOfferCheckResponse", null);
                ExternalInterface.addCallback("targetedWebOfferCheckFailed", null);
            };
            _SafeStr_4360 = null;
        }

        public function onShopOfferResult(_arg_1:Object):void
        {
            if (_arg_1 == null)
            {
                return;
            };
            var _local_2:HabboMallOffer = new HabboMallOffer(_arg_1);
            if (!_local_2)
            {
                return;
            };
            _SafeStr_4360.onHabboMallOffer(_local_2);
        }

        public function onShopOfferFailed():void
        {
        }


    }
}//package com.sulake.habbo.catalog.targetedoffers.util

// _SafeStr_4360 = "_-58" (String#91, DoABC#4)


