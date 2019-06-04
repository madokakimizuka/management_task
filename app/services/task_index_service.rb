# 宮崎さんに教えてもらったコード

# class TaskIndexService < BaseService
#   include BaseServiceImpl
#
#    concerning :TasksBuilder do
#      attr_reader :sort_expired
#
#      def tasks
#        @tasks ||= sort_expired.present? ?
#           Task.order(deadline: "DESC") :
#           Task.order(created_at: "DESC")
#      end
#    end
#
#    def run
#      return false if !validate
#
#      build_associate
#
#      return tasks
#    end
#
#    private
#
#    def build_associate
#    end
#
#    def validate
#      @errors = []
#      @errors.push('please check database') unless tasks.present?
#      return @errors.length == 0
#    end
#  end

# 参考URL
# https://moneyforward.com/engineers_blog/2018/12/15/formobject/

# 検索ワード
# accepts_nested_attributes_for　使わない
