// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.room.object.visualization.IRoomObjectGraphicVisualization

package com.sulake.room.object.visualization
{
    import com.sulake.room.object.visualization.utils.IGraphicAssetCollection;

    public /*dynamic*/ interface IRoomObjectGraphicVisualization extends IRoomObjectVisualization 
    {

        function get assetCollection():IGraphicAssetCollection;
        function set assetCollection(_arg_1:IGraphicAssetCollection):void;
        function setExternalBaseUrls(_arg_1:String, _arg_2:String, _arg_3:Boolean):void;

    }
}//package com.sulake.room.object.visualization

