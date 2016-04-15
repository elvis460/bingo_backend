class Backends::ExamsController < BackendsController
	before_action :find_exma , except: [:index]
	def index
		@exams = Exam.all
	end
	def new
	end

	def create
		@exam = Exam.new(exam_params)
		if @exam.save
      		redirect_to backends_exams_path,flash: { success: '題目已建立'}
      	else
      		redirect_to backends_exams_path,flash: { error: '題目建立失敗'}
      	end
	end
	def edit
	end
	def update
		@exam.update(exam_params)
   		redirect_to edit_backends_exam_path(id: @exam.id),flash: {success: "Update Success!"}
	end

	private
	def find_exma
		@exam = params[:id]? @exam = Exam.find(params[:id]) : Exam.new
	end
	def exam_params
		params.require(:exam).permit(:question,:answer,:tips,:level)
	end
end
