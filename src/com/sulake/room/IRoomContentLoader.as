// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.room.IRoomContentLoader

package com.sulake.room
{
    import flash.events.IEventDispatcher;
    import com.sulake.core.assets._SafeStr_21;
    import com.sulake.room.object.visualization.utils.IGraphicAssetCollection;
    import com.sulake.room.object.IRoomObject;

    public /*dynamic*/ interface IRoomContentLoader 
    {

        function dispose():void;
        function getPlaceHolderType(_arg_1:String):String;
        function getPlaceHolderTypes():Array;
        function getContentType(_arg_1:String):String;
        function hasInternalContent(_arg_1:String):Boolean;
        function loadObjectContent(_arg_1:String, _arg_2:IEventDispatcher):Boolean;
        function insertObjectContent(_arg_1:int, _arg_2:int, _arg_3:_SafeStr_21):Boolean;
        function getVisualizationType(_arg_1:String):String;
        function getLogicType(_arg_1:String):String;
        function hasVisualizationXML(_arg_1:String):Boolean;
        function getVisualizationXML(_arg_1:String):XML;
        function hasAssetXML(_arg_1:String):Boolean;
        function getAssetXML(_arg_1:String):XML;
        function hasLogicXML(_arg_1:String):Boolean;
        function getLogicXML(_arg_1:String):XML;
        function getGraphicAssetCollection(_arg_1:String):IGraphicAssetCollection;
        function roomObjectCreated(_arg_1:IRoomObject, _arg_2:String):void;

    }
}//package com.sulake.room

// _SafeStr_21 = "_-61a" (String#265, DoABC#4)


