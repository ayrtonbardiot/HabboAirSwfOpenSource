﻿// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.catalog.IVideoOfferManager

package com.sulake.habbo.catalog
{
    import com.sulake.habbo.catalog.enum.VideoOfferTypeEnum;

    public /*dynamic*/ interface IVideoOfferManager 
    {

        function get enabled():Boolean;
        function load(_arg_1:IVideoOfferLauncher):void;
        function launch(_arg_1:VideoOfferTypeEnum):Boolean;

    }
}//package com.sulake.habbo.catalog

