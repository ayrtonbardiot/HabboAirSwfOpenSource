﻿// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.catalog.viewer.widgets.IVipBuyCatalogWidget

package com.sulake.habbo.catalog.viewer.widgets
{
    import com.sulake.habbo.catalog.club.ClubBuyOfferData;

    public /*dynamic*/ interface IVipBuyCatalogWidget 
    {

        function dispose():void;
        function init():Boolean;
        function reset():void;
        function initClubType(_arg_1:int):void;
        function showOffer(_arg_1:ClubBuyOfferData):void;
        function get isGift():Boolean;

    }
}//package com.sulake.habbo.catalog.viewer.widgets

