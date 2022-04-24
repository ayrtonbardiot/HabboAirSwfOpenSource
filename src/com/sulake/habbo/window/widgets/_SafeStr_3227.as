// by nota

//com.sulake.habbo.window.widgets._SafeStr_3227

package com.sulake.habbo.window.widgets
{
    import flash.utils.Dictionary;

    public class _SafeStr_3227 
    {

        public static var _SafeStr_3731:Dictionary = new Dictionary();
        public static var WIDGET_TYPES:Array = [];
        private static var key:String;

        {
            _SafeStr_3731["avatar_image"] = AvatarImageWidget;
            _SafeStr_3731["badge_image"] = BadgeImageWidget;
            _SafeStr_3731["balloon"] = BalloonWidget;
            _SafeStr_3731["countdown"] = CountdownWidget;
            _SafeStr_3731["hover_bitmap"] = HoverBitmapWidget;
            _SafeStr_3731["illumina_border"] = IlluminaBorderWidget;
            _SafeStr_3731["illumina_chat_bubble"] = IlluminaChatBubbleWidget;
            _SafeStr_3731["illumina_input"] = IlluminaInputWidget;
            _SafeStr_3731["progress_indicator"] = ProgressIndicatorWidget;
            _SafeStr_3731["limited_item_overlay_grid"] = LimitedItemGridOverlayWidget;
            _SafeStr_3731["limited_item_overlay_preview"] = LimitedItemPreviewOverlayWidget;
            _SafeStr_3731["limited_item_overlay_supply"] = LimitedItemSupplyLeftOverlayWidget;
            _SafeStr_3731["rarity_item_overlay_grid"] = RarityItemGridOverlayWidget;
            _SafeStr_3731["rarity_item_overlay_preview"] = RarityItemPreviewOverlayWidget;
            _SafeStr_3731["separator"] = SeparatorWidget;
            _SafeStr_3731["updating_timestamp"] = UpdatingTimeStampWidget;
            _SafeStr_3731["running_number"] = RunningNumberWidget;
            _SafeStr_3731["pet_image"] = PetImageWidget;
            _SafeStr_3731["furniture_image"] = FurnitureImageWidget;
            _SafeStr_3731["room_previewer"] = RoomPreviewerWidget;
            _SafeStr_3731["pixel_limit"] = PixelLimitWidget;
            _SafeStr_3731["room_thumbnail"] = RoomThumbnailWidget;
            _SafeStr_3731["room_user_count"] = RoomUserCountWidget;
            for (key in _SafeStr_3731)
            {
                WIDGET_TYPES.push(key);
            };
            WIDGET_TYPES.sort();
        }


    }
}//package com.sulake.habbo.window.widgets

// _SafeStr_3227 = "_-R2" (String#15184, DoABC#4)
// _SafeStr_3731 = "_-YD" (String#2940, DoABC#4)


