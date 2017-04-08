package minimalcomps.designer;

import minimalcomps.components.PushButton;
import minimalcomps.components.Style;
import openfl.Assets;
import openfl.display.Sprite;
import openfl.events.Event;
import openfl.text.Font;


@:font("Assets/Fonts/pf_ronda_seven.ttf") private class RondaSevenFont extends Font {
}


class Designer extends Sprite {

    //------------------------------
    //  model
    //------------------------------


    //------------------------------
    //  lifecycle
    //------------------------------

    public function new() {
        super();

        initialize();
    }

    /**
     * initialize
     */
    public function initialize():Void {
        addEventListener(Event.ADDED_TO_STAGE, addedToStageHandler);

        #if js
        Style.fontName = Assets.getFont("pf_ronda_seven").fontName;
        #else
        Font.registerFont(RondaSevenFont);
        Style.fontName = (new RondaSevenFont()).fontName;
        #end

        Style.setStyle(Style.DARK);
    }

    /**
     * addedToStageHandler
     */
    private function addedToStageHandler(event:Event):Void {
        removeEventListener(Event.ADDED_TO_STAGE, addedToStageHandler);
        addEventListener(Event.REMOVED_FROM_STAGE, removedFromStageHandler);
    }

    /**
     * removedFromStageHandler
     */
    private function removedFromStageHandler(event:Event):Void {
        removeEventListener(Event.REMOVED_FROM_STAGE, removedFromStageHandler);
        addEventListener(Event.ADDED_TO_STAGE, addedToStageHandler);
    }

    /**
     * dispose (IDisposable)
     */
    public function dispose():Void {
        removeEventListener(Event.ADDED_TO_STAGE, addedToStageHandler);
        removeEventListener(Event.REMOVED_FROM_STAGE, removedFromStageHandler);
    }
}