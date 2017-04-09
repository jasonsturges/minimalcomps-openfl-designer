package;

import minimalcomps.designer.Designer;
import openfl.display.Sprite;
import openfl.display.StageScaleMode;
import openfl.display.StageAlign;
import openfl.events.Event;


class Main extends Sprite {

    //------------------------------
    //  model
    //------------------------------

    public var designer:Designer;


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
    }

    /**
     * addedToStageHandler
     */
    private function addedToStageHandler(event:Event):Void {
        removeEventListener(Event.ADDED_TO_STAGE, addedToStageHandler);
        addEventListener(Event.REMOVED_FROM_STAGE, removedFromStageHandler);
        stage.addEventListener(Event.RESIZE, resizeHandler);

        stage.scaleMode = StageScaleMode.NO_SCALE;
        stage.align = StageAlign.TOP_LEFT;

        designer = new Designer();
        addChild(designer);

        stage.dispatchEvent(new Event(Event.RESIZE));
    }

    /**
     * resizeHandler
     */
    private function resizeHandler(event:Event):Void {
        designer.resize(stage.stageWidth, stage.stageHeight);
    }

    /**
     * removedFromStageHandler
     */
    private function removedFromStageHandler(event:Event):Void {
        removeEventListener(Event.REMOVED_FROM_STAGE, removedFromStageHandler);
        addEventListener(Event.ADDED_TO_STAGE, addedToStageHandler);
        stage.removeEventListener(Event.RESIZE, resizeHandler);

        removeChild(designer);
    }

    /**
     * dispose
     */
    public function dispose():Void {
        removeEventListener(Event.ADDED_TO_STAGE, addedToStageHandler);
        removeEventListener(Event.REMOVED_FROM_STAGE, removedFromStageHandler);
        stage.removeEventListener(Event.RESIZE, resizeHandler);

        designer = null;
    }

}