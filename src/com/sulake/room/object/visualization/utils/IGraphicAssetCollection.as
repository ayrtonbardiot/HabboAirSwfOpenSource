// by nota

//com.sulake.room.object.visualization.utils.IGraphicAssetCollection

package com.sulake.room.object.visualization.utils
{
    import com.sulake.core.assets._SafeStr_21;
    import flash.display.BitmapData;

    public /*dynamic*/ interface IGraphicAssetCollection 
    {

        function dispose():void;
        function set assetLibrary(_arg_1:_SafeStr_21):void;
        function addReference():void;
        function removeReference():void;
        function getReferenceCount():int;
        function getLastReferenceTimeStamp():int;
        function define(_arg_1:XML):Boolean;
        function getAsset(_arg_1:String):IGraphicAsset;
        function getAssetWithPalette(_arg_1:String, _arg_2:String):IGraphicAsset;
        function getPaletteNames():Array;
        function getPaletteColors(_arg_1:String):Array;
        function getPaletteXML(_arg_1:String):XML;
        function addAsset(_arg_1:String, _arg_2:BitmapData, _arg_3:Boolean, _arg_4:int=0, _arg_5:int=0, _arg_6:Boolean=false, _arg_7:Boolean=false):Boolean;
        function disposeAsset(_arg_1:String):void;

    }
}//package com.sulake.room.object.visualization.utils

// _SafeStr_21 = "_-61a" (String#265, DoABC#4)


