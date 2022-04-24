// by nota

//com.sulake.habbo.room.object.visualization.furniture.FurnitureYoutubeDisplayVisualization

package com.sulake.habbo.room.object.visualization.furniture
{
    import com.sulake.room.object.IRoomObjectModel;
    import com.sulake.core.utils._SafeStr_24;

    public class FurnitureYoutubeDisplayVisualization extends ExternalIsometricImageFurniVisualization 
    {

        protected static const THUMBNAIL_URL_KEY:String = "THUMBNAIL_URL";


        override protected function getThumbnailURL():String
        {
            var _local_3:IRoomObjectModel = object.getModel();
            var _local_2:_SafeStr_24 = _local_3.getStringToStringMap("furniture_data");
            var _local_1:String = _local_3.getString("session_url_prefix");
            if (_local_1 == null)
            {
                return (null);
            };
            return (_local_1 + _local_2.getValue("THUMBNAIL_URL"));
        }


    }
}//package com.sulake.habbo.room.object.visualization.furniture

// _SafeStr_24 = "_-W1s" (String#60, DoABC#4)


